from connexion.resolver import RestyResolver
import connexion


if __name__ == '__main__':
    app = connexion.App(__name__, specification_dir='swagger/')
    app.add_api('app-swagger.yaml', resolver=RestyResolver('api'))
    app.run(host='0.0.0.0', port=8080)
