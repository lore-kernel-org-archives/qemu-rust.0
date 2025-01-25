Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tbjV4-0003zX-8w
	for mharc-qemu-rust@gnu.org; Sat, 25 Jan 2025 11:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbjV1-0003yp-UT
 for qemu-rust@nongnu.org; Sat, 25 Jan 2025 11:59:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbjV0-0008PP-7c
 for qemu-rust@nongnu.org; Sat, 25 Jan 2025 11:59:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso20555225e9.3
 for <qemu-rust@nongnu.org>; Sat, 25 Jan 2025 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737824348; x=1738429148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jM1PDPP54X96ITEZl+g5K5x7jxsI9/uafvBKFxpKGD8=;
 b=q+06aIkCssHxL4rnWOj0GbETYXxCOi95h8R1Qtma/PBgtfOy7CzkWkpIs3Whbnu44B
 DwA+P4cX7XD8bEqECcPXrSnYgeihLJstk/sPKX2VcSNkoCwREr6C7cyRIJ1RKLH0bJQA
 Z+xlJOVqZuPZ/azEQ70F55mUDidIBiW/RQbl7bsPXhkhMYKTpkTrAsM71IQPSePrjvht
 QzosT5ut67ceHxy45fQFVTsqdgV3iJYlElK4UwY/WxtHY7aBTo44BleESzG8PQFNpIyy
 pZaf5WnnOiUz1zutNLkEUPdFwfibQE1VTVhQU+IC5Kl9tS0IDCJEGKE+5TtkqTSXNE08
 BjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737824348; x=1738429148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jM1PDPP54X96ITEZl+g5K5x7jxsI9/uafvBKFxpKGD8=;
 b=IV3PwG4h86tl6JXlcNzv0HwGZNLn0XR0qIMiRZPP0xcVhr3UZxF/VBUE706vmK928s
 nLL8+zu7pQdjkyhhuNiRVKJRCbcIPSlsaFm2ZWuYXBsBwlqt7e793b1NxM/wbL9ZmjyE
 l27tp0FPRV+plxHpVMs5Hz0bPYsT63I31063R6OEsT1A3IUZ9oZQuJoj627annjNALOP
 qP8f4T0sMzq+KtipoIDm2K+qVpYLRhgEjPrBUp1XaSbM86wbRcQTLgyc3iu17C9DMNFQ
 5a+XOTRU3DcunrX+mcgcUxoaj1A0hWcwx8JSZLs6jg+OHyTEWiLZqamp3OS6u1tBInvf
 EWGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpXCYKwwef6ahGUGDrSMJHX3ueg5+xruzY41fknMYEZRGHDZ/I7S0FztmJLsE6gPXtQKClJ5Frs80=@nongnu.org
X-Gm-Message-State: AOJu0Yz/imKT873nU7+qB2wgO2f5ooef/Rvte7f3DXjEgjiZnCL4M60p
 2ZNTzNqEJupEFMXN0tZZYAml7wlPNReNIuYwY2dUj0KC7hQ+5J0ES0mxHkOS0X8=
X-Gm-Gg: ASbGnctdeRQuyxRxarxm88GZOPRtWdx7cfHpmgEllOG35b62mhFETPVLUHzikks0/vY
 Nh3oSGb97gYATvKukJDS7hVaWx95qrThHAPltIiegafm47Ehf5lqYhefvRZlaCKf0F+M5xjxhLd
 +19NFx40NCvyekExsejSWsONX2OqJyPN19OlxfD48LwD+2xaC7IAOSdXcZS2P8KBBzlwSuMuerT
 wftyy0o3GtSH6YTopPkjXMmLHCyTTmbqqDjsUBbVCV89X8oKtFicCZo6G2QYBooMpRDzvnYapSR
 B2qJkoWae0TxT8Xv7NerXHDga7JH5D/yghcIZ2iLJmKFgZEMBHipdug=
X-Google-Smtp-Source: AGHT+IEstb4RZCs9m6dWIM/YMoKVchpKZu+hmMSvyEt3TEhmfaGBpswIi44gipDf2veJAgKr/x79kQ==
X-Received: by 2002:a05:600c:1f10:b0:434:ff9d:a370 with SMTP id
 5b1f17b1804b1-438912d1d49mr340960205e9.0.1737824348113; 
 Sat, 25 Jan 2025 08:59:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd507c59sm66304325e9.17.2025.01.25.08.59.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 08:59:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-rust@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] qom: Introduce class_post_init() handler
Date: Sat, 25 Jan 2025 17:58:55 +0100
Message-ID: <20250125165855.32168-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125165855.32168-1-philmd@linaro.org>
References: <20250125165855.32168-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Jan 2025 16:59:13 -0000

Add a class_post_init() handler to be called by parents
*after* child class_init() handler is called. This is
necessary to have parent class check children properly
set some values or mandatory handlers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qom/object.h     |  7 +++++--
 qom/object.c             | 10 ++++++++++
 rust/qemu-api/src/qom.rs |  6 ++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 3776267e903..d1e437a81be 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -465,8 +465,10 @@ struct Object
  *   has occurred to allow a class to set its default virtual method pointers.
  *   This is also the function to use to override virtual methods from a parent
  *   class.
- * @class_data: Data to pass to the @class_init,
- *   @class_base_init. This can be useful when building dynamic
+ * @class_post_init: This function is called to finish initialization of
+ *   a class, after all @class_init functions were called.
+ * @class_data: Data to pass to the @class_base_init, @class_init, and
+ *   @class_post_init. This can be useful when building dynamic
  *   classes.
  * @interfaces: The list of interfaces associated with this type.  This
  *   should point to a static array that's terminated with a zero filled
@@ -488,6 +490,7 @@ struct TypeInfo
 
     void (*class_base_init)(ObjectClass *klass, void *data);
     void (*class_init)(ObjectClass *klass, void *data);
+    void (*class_post_init)(ObjectClass *klass, void *data);
     void *class_data;
 
     InterfaceInfo *interfaces;
diff --git a/qom/object.c b/qom/object.c
index 1a686dff5a0..694009f0c94 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -56,6 +56,7 @@ struct TypeImpl
 
     void (*class_base_init)(ObjectClass *klass, void *data);
     void (*class_init)(ObjectClass *klass, void *data);
+    void (*class_post_init)(ObjectClass *klass, void *data);
 
     void *class_data;
 
@@ -121,6 +122,7 @@ static TypeImpl *type_new(const TypeInfo *info)
 
     ti->class_base_init = info->class_base_init;
     ti->class_init = info->class_init;
+    ti->class_post_init = info->class_post_init;
     ti->class_data = info->class_data;
 
     ti->instance_init = info->instance_init;
@@ -416,6 +418,14 @@ static void type_initialize(TypeImpl *ti)
     if (ti->class_init) {
         ti->class_init(ti->class, ti->class_data);
     }
+
+    parent = type_get_parent(ti);
+    while (parent) {
+        if (parent->class_post_init) {
+            parent->class_post_init(ti->class, ti->class_data);
+        }
+        parent = type_get_parent(parent);
+    }
 }
 
 static void object_init_with_type(Object *obj, TypeImpl *ti)
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 6033228e338..d95e90153a9 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -470,6 +470,11 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
         unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void),
     > = None;
 
+    /// Called to finish initialization of a class.
+    const CLASS_POST_INIT: Option<
+        unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void),
+    > = None;
+
     const TYPE_INFO: TypeInfo = TypeInfo {
         name: Self::TYPE_NAME.as_ptr(),
         parent: Self::ParentType::TYPE_NAME.as_ptr(),
@@ -488,6 +493,7 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
         class_size: core::mem::size_of::<Self::Class>(),
         class_base_init: Self::CLASS_BASE_INIT,
         class_init: Some(rust_class_init::<Self>),
+        class_post_init: Self::CLASS_POST_INIT,
         class_data: core::ptr::null_mut(),
         interfaces: core::ptr::null_mut(),
     };
-- 
2.47.1


