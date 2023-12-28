from rest_framework import mixins, pagination, permissions, viewsets

from .models import Comment
from .serializers import CommentSerializer


class CommentNumberPagination(pagination.PageNumberPagination):
    page_size = 25
    page_size_query_param = "page_size"
    max_page_size = 1000


class CommentViewSet(
    mixins.CreateModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet
):
    """
    The filliwing endpoints for read and wirte comments
    """

    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    pagination_class = CommentNumberPagination
    premission_classes = permissions.AllowAny
    filterset_fields = {"reply_to": ["exact", "isnull"]}
    ordering_fields = ["username", "email", "created_at"]
    ordering = ["-created_at"]
