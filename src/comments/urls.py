from rest_framework.routers import DefaultRouter

from .views import CommentViewSet

api_router = DefaultRouter()
api_router.register(r"comment", CommentViewSet, "comment")
