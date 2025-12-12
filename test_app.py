from app import app

def test_predict_datapoint():
    response = app.test_client().post("/predictdata", data={
        'sex': 'female',
        'smoker': 'yes',
        'region': 'southwest',
        'children': '1',
        'age': '29',
        'bmi': '22.0'
    })

    assert response.status_code == 200
    # Aquí puedes verificar el contenido esperado en `home.html`
    # Por ejemplo:
    # assert b'Some Expected Result' in response.data
