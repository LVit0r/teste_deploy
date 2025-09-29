import pytest
from django.urls import reverse

@pytest.mark.django_db
def test_url_template_funcionando(client):
    url = reverse('homepage')
    response = client.get(url)

    assert response.status_code == 200
    
    template_names = [t.name for t in response.templates if t.name]
    assert 'home_page.html' in template_names


    #o assert verifica se a expressão é verdadeira ou falsa
    #client é usado para simular requisições HTTP
    #@pytest.mark.django_db serve para o teste acessar o banco de dados da aplicação e depois desfazer o que foi feito durante os testes.