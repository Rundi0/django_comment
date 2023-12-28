from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views

api_router = DefaultRouter()
api_router.register(r"comment", views.CommentViewSet, "comment")

urlpatterns = [
    path("", include(api_router.urls)),
]
