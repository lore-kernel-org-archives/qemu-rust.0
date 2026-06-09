Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D296CD8CB2
	for <qemu-rust@archiver.kernel.org>; Tue,  9 Jun 2026 17:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wX0D5-0007gi-7v; Tue, 09 Jun 2026 13:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cn-0007WI-Ay
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Ch-0001rk-7Y
 for qemu-rust@nongnu.org; Tue, 09 Jun 2026 13:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RIIsjklWbcutayG6SOK/nSI0TGaNMIJ0fYUtITssro=;
 b=fA81QngoqLYbRCjkBixTE/3XERYsC1RhLLWmglmWc1B+zrS5/4PosTZihtKQfTOEulKwwJ
 rvhYP0KK+KxzKxdE0dLg7FUu4kHmh21UmpiJINU7YM6WdGZBBUD4EjM4Eeb97ZiOhyyz8B
 gnutomYTHdfa8CdhLxuUjZ1nUMnWGE8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-sVyoq9SnM56lABEggM37iw-1; Tue, 09 Jun 2026 13:25:28 -0400
X-MC-Unique: sVyoq9SnM56lABEggM37iw-1
X-Mimecast-MFC-AGG-ID: sVyoq9SnM56lABEggM37iw_1781025928
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-517615db531so155818531cf.1
 for <qemu-rust@nongnu.org>; Tue, 09 Jun 2026 10:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025928; x=1781630728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+RIIsjklWbcutayG6SOK/nSI0TGaNMIJ0fYUtITssro=;
 b=TEhM4xnciyUv71+ld3z/Ya3Pf10O8zqq/VWBh5bMB65otz8R1GL2S2dRl+WCwFUpM/
 Qt7iTWcvsIP2u/Up38zuuPNYoOA5W2xyDW2xfFO4O2el3wToqoy5n9BIDhOC1M1f2DVT
 vTK+9LGnTlxZLrq3bpYb4Ue5eU95pv6oBev/o2Cgm9KL0BlJ1H1gBdZfI8P8cUs775XC
 mrqEMGvReotOGYUQwA9bJWXmaF0UUglSaQO/GgGwo5FQqlAOzOkobtx+ox0v6ccTDAiI
 HjepQB/6hy3+Lrf1VE67IPMJu9LGChRLL14GDAHD1Q8QXTMuiJ194cV1ryN0zzvEk4LR
 YDpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TEoEKWADMfU0bksoTTY+aeN72xJ1Aw2zEkAoKxgpRqwiL4qC4cv7u7h5Uz8LhsP0unUh7QmmYAz4=@nongnu.org
X-Gm-Message-State: AOJu0YwwtLiyKysFDm0bqVaEIGcvU3MOZe6m70hM9PhQQXlRU+5kZO77
 AnbGOKdmpI3vo2FweMrkl12KH27ngfB8RRXwp/IsJuH02LVTxqztk35bj0cO8/8eyy0+wurV46P
 nINVGmxQm9YcFNgZXW9D9r4UsKvmbitxDSfCGw75vROu1Ss89RB5sk3g=
X-Gm-Gg: Acq92OFzeoGKUsSgTN80GU256YwstowZvqGZ5i0rKkV2Zf8g8jVC/hik277VhDkLlBK
 NZX4P4sPPHe4Gb1v1kvd0FqzTx1KkicTc/bZbLuv1UafMrDV20jXz4I2uTkbzLJcVusS2ma0CAv
 9Dc6PRMrfyVVSAT7fVww90SL9UjGIYEdU+EJWWTLwW+vXj653Kwz3qMpaVl8DS70t9mO6dbK114
 6VwmSOMLQln2Ajnk9XFCEj0EP1Tb4cUp00y0faNo13ulLmQE+fai5saQ0zIitDnutoYvu7I2QCS
 CM5xcWD0xtgaiOsaptz3ukNZ2p3tBL7LiLIJVJNHLwGXg2pyoJPsz4hbjTIDw0HR438r7kcV2F7
 V5K5u499yspOI/bhFtlZaHHg=
X-Received: by 2002:a05:622a:1808:b0:517:96f0:5658 with SMTP id
 d75a77b69052e-51796f06eadmr297342021cf.14.1781025927226; 
 Tue, 09 Jun 2026 10:25:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1808:b0:517:96f0:5658 with SMTP id
 d75a77b69052e-51796f06eadmr297341161cf.14.1781025926446; 
 Tue, 09 Jun 2026 10:25:26 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:25 -0700 (PDT)
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
Subject: [PATCH v2 05/10] qom: Create object-property-ptr.[ch]
Date: Tue,  9 Jun 2026 13:25:09 -0400
Message-ID: <20260609172514.2037645-6-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _-oRNS-kAr8KAtTvp9Pf7CmlFvRm4gTU4Y9yl7f2u6w_1781025928
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Create object-property-ptr.[ch] files to include all the helpers for
object_property_add*_ptr().

These set of helpers are handy because they look extremely familiar with
qdev-properties, allowing the caller to provide a pointer and it will
manage all the setters and getters.

The follow up patches may introduce more of such helpers.  Since object.c
has been already too big, split that part out.

No functional change intended.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qom/object-property-ptr.h | 103 +++++++++++++
 include/qom/object.h              |  99 +-----------
 qom/object-property-ptr.c         | 248 ++++++++++++++++++++++++++++++
 qom/object.c                      | 240 -----------------------------
 qom/meson.build                   |   1 +
 5 files changed, 358 insertions(+), 333 deletions(-)
 create mode 100644 include/qom/object-property-ptr.h
 create mode 100644 qom/object-property-ptr.c

diff --git a/include/qom/object-property-ptr.h b/include/qom/object-property-ptr.h
new file mode 100644
index 0000000000..6066c377fb
--- /dev/null
+++ b/include/qom/object-property-ptr.h
@@ -0,0 +1,103 @@
+/*
+ * Object property helpers to operate on a pointer.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_OBJECT_PROPERTY_PTR_H
+#define QEMU_OBJECT_PROPERTY_PTR_H
+
+typedef enum {
+    /* Automatically add a getter to the property */
+    OBJ_PROP_FLAG_READ = 1 << 0,
+    /* Automatically add a setter to the property */
+    OBJ_PROP_FLAG_WRITE = 1 << 1,
+    /* Automatically add a getter and a setter to the property */
+    OBJ_PROP_FLAG_READWRITE = (OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE),
+} ObjectPropertyFlags;
+
+/**
+ * object_property_add_uint8_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add an integer property in memory.  This function will add a
+ * property of type 'uint8'.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *object_property_add_uint8_ptr(Object *obj, const char *name,
+                                              const uint8_t *v,
+                                              ObjectPropertyFlags flags);
+
+ObjectProperty *object_class_property_add_uint8_ptr(ObjectClass *klass,
+                                         const char *name,
+                                         const uint8_t *v,
+                                         ObjectPropertyFlags flags);
+
+/**
+ * object_property_add_uint16_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add an integer property in memory.  This function will add a
+ * property of type 'uint16'.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *object_property_add_uint16_ptr(Object *obj, const char *name,
+                                    const uint16_t *v,
+                                    ObjectPropertyFlags flags);
+
+ObjectProperty *object_class_property_add_uint16_ptr(ObjectClass *klass,
+                                          const char *name,
+                                          const uint16_t *v,
+                                          ObjectPropertyFlags flags);
+
+/**
+ * object_property_add_uint32_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add an integer property in memory.  This function will add a
+ * property of type 'uint32'.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *object_property_add_uint32_ptr(Object *obj, const char *name,
+                                    const uint32_t *v,
+                                    ObjectPropertyFlags flags);
+
+ObjectProperty *object_class_property_add_uint32_ptr(ObjectClass *klass,
+                                          const char *name,
+                                          const uint32_t *v,
+                                          ObjectPropertyFlags flags);
+
+/**
+ * object_property_add_uint64_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add an integer property in memory.  This function will add a
+ * property of type 'uint64'.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *object_property_add_uint64_ptr(Object *obj, const char *name,
+                                    const uint64_t *v,
+                                    ObjectPropertyFlags flags);
+
+ObjectProperty *object_class_property_add_uint64_ptr(ObjectClass *klass,
+                                          const char *name,
+                                          const uint64_t *v,
+                                          ObjectPropertyFlags flags);
+
+#endif
diff --git a/include/qom/object.h b/include/qom/object.h
index 11f55613fc..6ea569d580 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1931,99 +1931,6 @@ ObjectProperty *object_class_property_add_tm(ObjectClass *klass,
                             const char *name,
                             void (*get)(Object *, struct tm *, Error **));
 
-typedef enum {
-    /* Automatically add a getter to the property */
-    OBJ_PROP_FLAG_READ = 1 << 0,
-    /* Automatically add a setter to the property */
-    OBJ_PROP_FLAG_WRITE = 1 << 1,
-    /* Automatically add a getter and a setter to the property */
-    OBJ_PROP_FLAG_READWRITE = (OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE),
-} ObjectPropertyFlags;
-
-/**
- * object_property_add_uint8_ptr:
- * @obj: the object to add a property to
- * @name: the name of the property
- * @v: pointer to value
- * @flags: bitwise-or'd ObjectPropertyFlags
- *
- * Add an integer property in memory.  This function will add a
- * property of type 'uint8'.
- *
- * Returns: The newly added property on success, or %NULL on failure.
- */
-ObjectProperty *object_property_add_uint8_ptr(Object *obj, const char *name,
-                                              const uint8_t *v,
-                                              ObjectPropertyFlags flags);
-
-ObjectProperty *object_class_property_add_uint8_ptr(ObjectClass *klass,
-                                         const char *name,
-                                         const uint8_t *v,
-                                         ObjectPropertyFlags flags);
-
-/**
- * object_property_add_uint16_ptr:
- * @obj: the object to add a property to
- * @name: the name of the property
- * @v: pointer to value
- * @flags: bitwise-or'd ObjectPropertyFlags
- *
- * Add an integer property in memory.  This function will add a
- * property of type 'uint16'.
- *
- * Returns: The newly added property on success, or %NULL on failure.
- */
-ObjectProperty *object_property_add_uint16_ptr(Object *obj, const char *name,
-                                    const uint16_t *v,
-                                    ObjectPropertyFlags flags);
-
-ObjectProperty *object_class_property_add_uint16_ptr(ObjectClass *klass,
-                                          const char *name,
-                                          const uint16_t *v,
-                                          ObjectPropertyFlags flags);
-
-/**
- * object_property_add_uint32_ptr:
- * @obj: the object to add a property to
- * @name: the name of the property
- * @v: pointer to value
- * @flags: bitwise-or'd ObjectPropertyFlags
- *
- * Add an integer property in memory.  This function will add a
- * property of type 'uint32'.
- *
- * Returns: The newly added property on success, or %NULL on failure.
- */
-ObjectProperty *object_property_add_uint32_ptr(Object *obj, const char *name,
-                                    const uint32_t *v,
-                                    ObjectPropertyFlags flags);
-
-ObjectProperty *object_class_property_add_uint32_ptr(ObjectClass *klass,
-                                          const char *name,
-                                          const uint32_t *v,
-                                          ObjectPropertyFlags flags);
-
-/**
- * object_property_add_uint64_ptr:
- * @obj: the object to add a property to
- * @name: the name of the property
- * @v: pointer to value
- * @flags: bitwise-or'd ObjectPropertyFlags
- *
- * Add an integer property in memory.  This function will add a
- * property of type 'uint64'.
- *
- * Returns: The newly added property on success, or %NULL on failure.
- */
-ObjectProperty *object_property_add_uint64_ptr(Object *obj, const char *name,
-                                    const uint64_t *v,
-                                    ObjectPropertyFlags flags);
-
-ObjectProperty *object_class_property_add_uint64_ptr(ObjectClass *klass,
-                                          const char *name,
-                                          const uint64_t *v,
-                                          ObjectPropertyFlags flags);
-
 /**
  * object_property_add_alias:
  * @obj: the object to add a property to
@@ -2141,4 +2048,10 @@ char *object_property_help(const char *name, const char *type,
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
 
+/*
+ * Object property ptr helpers cannot be included at the beginning of the
+ * file, because it depends on QOM definitions in current header.
+ */
+#include "qom/object-property-ptr.h"
+
 #endif
diff --git a/qom/object-property-ptr.c b/qom/object-property-ptr.c
new file mode 100644
index 0000000000..02c01ed7f0
--- /dev/null
+++ b/qom/object-property-ptr.c
@@ -0,0 +1,248 @@
+/*
+ * Object property helpers to operate on a pointer.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "qapi/visitor.h"
+
+static void property_get_uint8_ptr(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    uint8_t value = *(uint8_t *)opaque;
+    visit_type_uint8(v, name, &value, errp);
+}
+
+static void property_set_uint8_ptr(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    uint8_t *field = opaque;
+    uint8_t value;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
+static void property_get_uint16_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint16_t value = *(uint16_t *)opaque;
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void property_set_uint16_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint16_t *field = opaque;
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
+static void property_get_uint32_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint32_t value = *(uint32_t *)opaque;
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void property_set_uint32_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint32_t *field = opaque;
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
+static void property_get_uint64_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint64_t value = *(uint64_t *)opaque;
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    uint64_t *field = opaque;
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
+ObjectProperty *
+object_property_add_uint8_ptr(Object *obj, const char *name,
+                              const uint8_t *v,
+                              ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint8_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint8_ptr;
+    }
+
+    return object_property_add(obj, name, "uint8",
+                               getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_class_property_add_uint8_ptr(ObjectClass *klass, const char *name,
+                                    const uint8_t *v,
+                                    ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint8_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint8_ptr;
+    }
+
+    return object_class_property_add(klass, name, "uint8",
+                                     getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_property_add_uint16_ptr(Object *obj, const char *name,
+                               const uint16_t *v,
+                               ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint16_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint16_ptr;
+    }
+
+    return object_property_add(obj, name, "uint16",
+                               getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_class_property_add_uint16_ptr(ObjectClass *klass, const char *name,
+                                     const uint16_t *v,
+                                     ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint16_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint16_ptr;
+    }
+
+    return object_class_property_add(klass, name, "uint16",
+                                     getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_property_add_uint32_ptr(Object *obj, const char *name,
+                               const uint32_t *v,
+                               ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint32_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint32_ptr;
+    }
+
+    return object_property_add(obj, name, "uint32",
+                               getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_class_property_add_uint32_ptr(ObjectClass *klass, const char *name,
+                                     const uint32_t *v,
+                                     ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint32_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint32_ptr;
+    }
+
+    return object_class_property_add(klass, name, "uint32",
+                                     getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_property_add_uint64_ptr(Object *obj, const char *name,
+                               const uint64_t *v,
+                               ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint64_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint64_ptr;
+    }
+
+    return object_property_add(obj, name, "uint64",
+                               getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_class_property_add_uint64_ptr(ObjectClass *klass, const char *name,
+                                     const uint64_t *v,
+                                     ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_uint64_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_uint64_ptr;
+    }
+
+    return object_class_property_add(klass, name, "uint64",
+                                     getter, setter, NULL, (void *)v);
+}
diff --git a/qom/object.c b/qom/object.c
index 0ac201de4c..fc738549dc 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2673,246 +2673,6 @@ static char *object_get_type(Object *obj, Error **errp)
     return g_strdup(object_get_typename(obj));
 }
 
-static void property_get_uint8_ptr(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    uint8_t value = *(uint8_t *)opaque;
-    visit_type_uint8(v, name, &value, errp);
-}
-
-static void property_set_uint8_ptr(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    uint8_t *field = opaque;
-    uint8_t value;
-
-    if (!visit_type_uint8(v, name, &value, errp)) {
-        return;
-    }
-
-    *field = value;
-}
-
-static void property_get_uint16_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint16_t value = *(uint16_t *)opaque;
-    visit_type_uint16(v, name, &value, errp);
-}
-
-static void property_set_uint16_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint16_t *field = opaque;
-    uint16_t value;
-
-    if (!visit_type_uint16(v, name, &value, errp)) {
-        return;
-    }
-
-    *field = value;
-}
-
-static void property_get_uint32_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint32_t value = *(uint32_t *)opaque;
-    visit_type_uint32(v, name, &value, errp);
-}
-
-static void property_set_uint32_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint32_t *field = opaque;
-    uint32_t value;
-
-    if (!visit_type_uint32(v, name, &value, errp)) {
-        return;
-    }
-
-    *field = value;
-}
-
-static void property_get_uint64_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint64_t value = *(uint64_t *)opaque;
-    visit_type_uint64(v, name, &value, errp);
-}
-
-static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    uint64_t *field = opaque;
-    uint64_t value;
-
-    if (!visit_type_uint64(v, name, &value, errp)) {
-        return;
-    }
-
-    *field = value;
-}
-
-ObjectProperty *
-object_property_add_uint8_ptr(Object *obj, const char *name,
-                              const uint8_t *v,
-                              ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint8_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint8_ptr;
-    }
-
-    return object_property_add(obj, name, "uint8",
-                               getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_class_property_add_uint8_ptr(ObjectClass *klass, const char *name,
-                                    const uint8_t *v,
-                                    ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint8_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint8_ptr;
-    }
-
-    return object_class_property_add(klass, name, "uint8",
-                                     getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_property_add_uint16_ptr(Object *obj, const char *name,
-                               const uint16_t *v,
-                               ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint16_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint16_ptr;
-    }
-
-    return object_property_add(obj, name, "uint16",
-                               getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_class_property_add_uint16_ptr(ObjectClass *klass, const char *name,
-                                     const uint16_t *v,
-                                     ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint16_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint16_ptr;
-    }
-
-    return object_class_property_add(klass, name, "uint16",
-                                     getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_property_add_uint32_ptr(Object *obj, const char *name,
-                               const uint32_t *v,
-                               ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint32_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint32_ptr;
-    }
-
-    return object_property_add(obj, name, "uint32",
-                               getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_class_property_add_uint32_ptr(ObjectClass *klass, const char *name,
-                                     const uint32_t *v,
-                                     ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint32_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint32_ptr;
-    }
-
-    return object_class_property_add(klass, name, "uint32",
-                                     getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_property_add_uint64_ptr(Object *obj, const char *name,
-                               const uint64_t *v,
-                               ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint64_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint64_ptr;
-    }
-
-    return object_property_add(obj, name, "uint64",
-                               getter, setter, NULL, (void *)v);
-}
-
-ObjectProperty *
-object_class_property_add_uint64_ptr(ObjectClass *klass, const char *name,
-                                     const uint64_t *v,
-                                     ObjectPropertyFlags flags)
-{
-    ObjectPropertyAccessor *getter = NULL;
-    ObjectPropertyAccessor *setter = NULL;
-
-    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
-        getter = property_get_uint64_ptr;
-    }
-
-    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
-        setter = property_set_uint64_ptr;
-    }
-
-    return object_class_property_add(klass, name, "uint64",
-                                     getter, setter, NULL, (void *)v);
-}
-
 typedef struct {
     Object *target_obj;
     char *target_name;
diff --git a/qom/meson.build b/qom/meson.build
index bd6f4aadd7..2c746aaa9c 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -3,6 +3,7 @@ qom_ss.add(files(
   'container.c',
   'object.c',
   'object_interfaces.c',
+  'object-property-ptr.c',
   'qom-qobject.c',
 ))
 if have_system
-- 
2.53.0


