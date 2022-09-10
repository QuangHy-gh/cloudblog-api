from django.db import models
from django.contrib.contenttypes.models import ContentType

# Create your models here.
class HitcountHitCount(models.Model):
    id = models.BigAutoField(primary_key=True)
    hits = models.IntegerField()
    modified = models.DateTimeField()
    object_pk = models.IntegerField()
    content_type = models.ForeignKey(ContentType, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = "hitcount_hit_count"
        unique_together = (("content_type", "object_pk"),)
