from rest_framework import serializers

from blog_api.models import HitcountHitCount


class HitcountHitCountSerializer(serializers.ModelSerializer):
    class Meta:
        model = HitcountHitCount
        fields = ("object_pk", "hits")
