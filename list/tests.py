from django.test import TestCase
from django.urls import reverse


class UrlsTestCase(TestCase):
    def test_url_home_funcionando(self):
        url = reverse("homepage")
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "home_page.html")


