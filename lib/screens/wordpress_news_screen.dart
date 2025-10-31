import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';

class WordpressNewsScreen extends StatefulWidget {
  const WordpressNewsScreen({super.key});

  @override
  State<WordpressNewsScreen> createState() => _WordpressNewsScreenState();
}

class _WordpressNewsScreenState extends State<WordpressNewsScreen> {
  List<dynamic> news = [];
  bool isLoading = false;
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadNews();
    _scrollController.addListener(_onScroll);
  }

  Future<void> loadNews({bool refresh = false}) async {
    if (isLoading) return;
    setState(() => isLoading = true);

    if (refresh) {
      currentPage = 1;
      news.clear();
    }

    final data = await ApiService.getWordpressNews(page: currentPage);

    if (data != null && mounted) {
      setState(() {
        news.addAll(data);
        currentPage++;
      });
    }

    setState(() => isLoading = false);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      loadNews(); // carga más cuando llega al final
    }
  }

  void openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Noticias WordPress")),
      body: RefreshIndicator(
        onRefresh: () => loadNews(refresh: true), // deslizar hacia abajo → recargar
        child: ListView.builder(
          controller: _scrollController,
          itemCount: news.length + 1,
          itemBuilder: (context, index) {
            if (index == news.length) {
              return isLoading
                  ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              )
                  : const SizedBox.shrink();
            }

            final item = news[index];
            final title = item["title"]["rendered"];
            final excerpt = item["excerpt"]["rendered"]
                .replaceAll(RegExp(r'<[^>]*>'), "");
            final link = item["link"];

            return Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(excerpt),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => openLink(link),
                        child: const Text("Visitar"),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
