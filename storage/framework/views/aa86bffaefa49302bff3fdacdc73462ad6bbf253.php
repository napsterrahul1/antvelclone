<meta name="description" content = "<?php echo e($description); ?>">

<meta name = "twitter:card" content = "summary_large_image">
<meta name = "twitter:site" content = "{{ $main_company['twitter'] }}">
<meta name = "twitter:title" content = "<?php echo e($title); ?>">
<meta name = "twitter:image" content = "<?php echo e($image); ?>">
<meta name = "twitter:description" content = "<?php echo e($description); ?>">

<meta property = "og:title" content = "<?php echo e($title); ?>" />
<meta property = "og:site_name" content = "<?php echo e($main_company['website_name']); ?>"/>
<meta property = "og:description" content = "<?php echo e($description); ?>" />
<meta property = "og:image" content = "<?php echo e($image); ?>" >
<meta property = "og:type" content = "og:product" />
<meta property = "og:url" content = "<?php echo e(Request::url()); ?>" />
<meta property = "fb:app_id" content  =  "<?php echo e(env('FB_APP_ID')); ?>" />
<meta property = "og:image:width" content = "450"/>
<meta property = "og:image:height" content = "298"/>


<script type="application/ld+json">
    {
      "@context": "http://schema.org/",
      "@type": "Product",
      "name": "<?php echo e($title); ?>",
      "image": "<?php echo e($image); ?>",
      "description": "<?php echo e($description); ?>",
      "mpn": "<?php echo e($id); ?>",
      "brand": {
        "@type": "Thing",
        "name": "<?php echo e($brand); ?>"
      },
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "<?php echo e($rate_val); ?>",
        "reviewCount": "<?php echo e($rate_count); ?>"
      }
    }
</script>