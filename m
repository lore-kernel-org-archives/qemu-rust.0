Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F29CD98C7
	for <qemu-rust@archiver.kernel.org>; Tue,  9 Jun 2026 17:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wX0D5-0007gk-80; Tue, 09 Jun 2026 13:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Ct-0007Yp-M3
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cr-0001wM-1y
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ho/BMxX8YnQ131yrIsVBM8rRwXj38KUVhIf57yJSr4U=;
 b=iqNNVHk5caVDGU79R69Eu+SsGZDKBMultXcibcsWNMe/9GsZXjQfs+CvzW9mWMwvI9QaKW
 c7rOIdcZhQmJQF7duFG+B7loFzfnRYNVP+8qM9aS8yEtP+iiSeDFNXBd4RhH6CwA3LPS91
 qLmF2iUiPy5mbXKrltGpd+hDAy32YP0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-quVFKHnhN5mWVs2Ktl6C_Q-1; Tue, 09 Jun 2026 13:25:37 -0400
X-MC-Unique: quVFKHnhN5mWVs2Ktl6C_Q-1
X-Mimecast-MFC-AGG-ID: quVFKHnhN5mWVs2Ktl6C_Q_1781025936
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51760f997fdso172889771cf.2
 for <qemu-rust@nongnu.org>; Tue, 09 Jun 2026 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025936; x=1781630736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ho/BMxX8YnQ131yrIsVBM8rRwXj38KUVhIf57yJSr4U=;
 b=Na74NoQZUKif+YsqrV5rrG55SPh34h0k5Hn+q0wyTwK7h8yAsfyIUhDnOouibI4O20
 g0UxAjon6+YkSrR40CxQRxTYv5txftNrV9tfxqqJagL+Iqz6mVEWRpl+x/lusI4t1zRb
 Dfxe9YwV5Q4tlJ2XNMZsHo0cFWwEd6Ys/towGiQwZKRekDxBBQ+TCdM/BqnAU3YVmQnL
 LvWowOxq7DtsH1TApmL2qwzTyZ7MIkNJ9AcRd7HwNKMbG2xSkB9Glz3VehBJO93gT2VD
 ghKcWACwxRAm6Y5lJuKcjB+WuyGq/h5IGDN7DURXX+vdWe1SP4z1xvRzylJGyPBQPhN9
 j05A==
X-Forwarded-Encrypted: i=1;
 AFNElJ93zyfvByxg1SxIxpA412wGMrXULGYadcHcFZZN/8KcLqAXgkmaNr8cOXN/60VwpIyeIFP5/uLusBw=@nongnu.org
X-Gm-Message-State: AOJu0Yx2IWMecF8FJX6vZXD3HDTQFfXH/88b0vmY5asx6dv8A7EnHaYQ
 Einu8lwBzWNdGKEQ0biT4LjIJ3aQlhVB9CRMpMTIfSS+m6avhP2nPKlGMk7nAsuv4xvItGWuj1/
 NMljdujkhAAehnWyGknTCj4RE13OlUA7DQnYCKLeois3+3P7Sk9C0NWo=
X-Gm-Gg: Acq92OEd9AnoNMlDehWSkOHM31kNAuIVt88SWiivDYHN6hsDMrVYKAQnLTX0NKjQQpt
 eCO0pwW3OXW/tU7b6AwzDgX3LtdBo0AXDX80cHGXSTy7UIwn0GFhAo5fhMn7HXQlNM+dYXmILtr
 tLWe+CG6vY4O6b3nS6IiEaNB4bCOTjgv8HeTq+slKC7O4msEAZwqB/FrUrrJoT8JVwmZ+4B3PDo
 cMxxRy4cj2yQvq+25/q1yCSS3QwVkX3JsUVSjiGYh5ZZH/8DBaJmz2xOYDJQ0GBD4CqTtu93Ta3
 gQTUlW3ANqzR3xB46ZcUnjXO962Wj5LOtDGYT/S/XcvwzaipU2sLakGZrjsw621c95vwvYWpsZQ
 3Um7EbCP/Y14vEZBlGDbS80Q=
X-Received: by 2002:a05:622a:400c:b0:517:7971:a234 with SMTP id
 d75a77b69052e-51795b729ffmr305681401cf.4.1781025936237; 
 Tue, 09 Jun 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a05:622a:400c:b0:517:7971:a234 with SMTP id
 d75a77b69052e-51795b729ffmr305680851cf.4.1781025935723; 
 Tue, 09 Jun 2026 10:25:35 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:35 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 08/10] qom: Add object_property_add_*_ptr_def()
Date: Tue,  9 Jun 2026 13:25:12 -0400
Message-ID: <20260609172514.2037645-9-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ovD6_AWZQ0m7WFWq6cJPNWg96SVf7I_bsUevkZvpGSs_1781025936
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Add sister functions for existing pointer versions, to make it even easier
to use by:

- always make properties to be rw-able
- allowing to specify default values
- no retcode needed (assert on failure, always)

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qom/object-property-ptr.h | 28 +++++++++++++
 qom/object-property-ptr.c         | 67 +++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/include/qom/object-property-ptr.h b/include/qom/object-property-ptr.h
index be467c64af..ecd6f7819b 100644
--- a/include/qom/object-property-ptr.h
+++ b/include/qom/object-property-ptr.h
@@ -131,4 +131,32 @@ object_property_add_size_ptr(Object *obj, const char *name,
                              const uint64_t *v,
                              ObjectPropertyFlags flags);
 
+/*
+ * Below are sister helpers of above, except that:
+ *
+ * (1) nothing is returned
+ * (2) always make the property to be both readable and writeable
+ * (3) allow setting default value
+ *
+ * Please refer to the sister functions for the documentation.
+ */
+void
+object_property_add_bool_ptr_def(Object *obj, const char *name,
+                                 const bool *v, bool def);
+void
+object_property_add_uint8_ptr_def(Object *obj, const char *name,
+                                  const uint8_t *v, uint8_t def);
+void
+object_property_add_uint16_ptr_def(Object *obj, const char *name,
+                                   const uint16_t *v, uint16_t def);
+void
+object_property_add_uint32_ptr_def(Object *obj, const char *name,
+                                   const uint32_t *v, uint32_t def);
+void
+object_property_add_uint64_ptr_def(Object *obj, const char *name,
+                                   const uint64_t *v, uint64_t def);
+void
+object_property_add_size_ptr_def(Object *obj, const char *name,
+                                 const uint64_t *v, uint64_t def);
+
 #endif
diff --git a/qom/object-property-ptr.c b/qom/object-property-ptr.c
index 21ceb2510d..ae9081d2d8 100644
--- a/qom/object-property-ptr.c
+++ b/qom/object-property-ptr.c
@@ -325,3 +325,70 @@ object_property_add_size_ptr(Object *obj, const char *name,
     return object_property_add(obj, name, "size",
                                getter, setter, NULL, (void *)v);
 }
+
+void
+object_property_add_bool_ptr_def(Object *obj, const char *name,
+                                 const bool *v, bool def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_bool_ptr(obj, name, v,
+                                        OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_bool(prop, def);
+}
+
+
+void
+object_property_add_uint8_ptr_def(Object *obj, const char *name,
+                                  const uint8_t *v, uint8_t def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_uint8_ptr(obj, name, v,
+                                         OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_uint(prop, def);
+}
+
+void
+object_property_add_uint16_ptr_def(Object *obj, const char *name,
+                                   const uint16_t *v, uint16_t def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_uint16_ptr(obj, name, v,
+                                          OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_uint(prop, def);
+}
+
+void
+object_property_add_uint32_ptr_def(Object *obj, const char *name,
+                                   const uint32_t *v, uint32_t def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_uint32_ptr(obj, name, v,
+                                          OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_uint(prop, def);
+}
+
+void
+object_property_add_uint64_ptr_def(Object *obj, const char *name,
+                                   const uint64_t *v, uint64_t def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_uint64_ptr(obj, name, v,
+                                          OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_uint(prop, def);
+}
+
+void
+object_property_add_size_ptr_def(Object *obj, const char *name,
+                                 const uint64_t *v, uint64_t def)
+{
+    ObjectProperty *prop;
+
+    prop = object_property_add_size_ptr(obj, name, v,
+                                        OBJ_PROP_FLAG_READWRITE);
+    object_property_set_default_uint(prop, def);
+}
-- 
2.53.0


