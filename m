Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU6A-0004pb-Cj
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU60-0004nL-Ud
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU5w-0007Hc-OY
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQhR97xfSSLWGt+89NRShLRBPBcpvzkoM5n21YvipV0=;
 b=YIOIUeOB8uDndeEVhXPYUERGsuvbIVcGPqh8E3TRmStqyl7HJOtG8DQZjmisOU/4y+zi7i
 XIBFpJNLh2wv7ZDDe15SXPx4FEgk7zjUNowow0qZZGHkVPQ99ikTuEzKjRNFY0ijatRCM7
 dWHwrH3r9NhJg0PFwCIEmd8xdrwyPVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-SaFdthmXPAGVB6b7O54x9A-1; Mon, 25 Nov 2024 03:05:17 -0500
X-MC-Unique: SaFdthmXPAGVB6b7O54x9A-1
X-Mimecast-MFC-AGG-ID: SaFdthmXPAGVB6b7O54x9A
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38243a4ba5fso2938857f8f.2
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521915; x=1733126715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQhR97xfSSLWGt+89NRShLRBPBcpvzkoM5n21YvipV0=;
 b=Qe0bjgDcvTpT/pcW0KaRjGqAwWK1mbZxRY2D8WTTchfLHvT3pW4deI+arQ702cgbQe
 BwW5aBLuCr6u1jxpT3ezqYKqUs9U4pbjvULsXNCJ9YqW4axmXU40svfHHCxt0m2cm8wL
 wY9hZlY+hIszDXWAgUrOGxGK4XqjZvtANx8vnrlvRLJ4P8DtcwUEJ6PlMQRBzv/vCMKC
 upMW7nPhXkCGVGMkh58NmJfVjG/qtMaV1pb2BDO+UywwyXJ+xZuJmL7LBYv4GGUXbV5E
 /Cf/gxBk2BP9D043FfISG3gi2Yyd69GrfVLxQHO5lyduUAKhwN83C3dQfhoVcJQYMZKm
 uKIA==
X-Gm-Message-State: AOJu0Yy5zGMzubrAp7xYj5QZ51ACuC/wo7PXcyuNZbn8xR3zm4TTN71K
 gm1B+ZvkKLVIHRfpYPgT/IutVS91i4hlPg5sJKmoXECSZrZwW7ocDt+Vjv87dXCW1SVauaZxEzG
 Cd4JQgVkDdIH1TY4N/seQeHiGp/yhir8ofUHEb2aghj5d9luHBTcC9ciUwZc=
X-Gm-Gg: ASbGncvDLks0UWxcMqOyVZ60U+Be2/VfGr7AhKOfufO2NgH4kZUT5Xcuz0GQirlS+Lx
 UZik23ga2V6ppBf1y8arXOsbPZO7qyQu6LUDNfsIDdmxiJyFhu+DUo/ZydwknKes7DPx5rN9+R/
 pOWhBRW1RxZiI0ZzXrbwiqPD32OovOSoHle5RVD9WxDr1imfJdxMhAczFKa5u+9JVga05VkRBMP
 Uww7Up+L5t9dmR9ItLsUmFMmO/DAd+9D5Zu7aYIF3m4QFVieUwnEiU=
X-Received: by 2002:a5d:64e4:0:b0:382:4edb:19c7 with SMTP id
 ffacd0b85a97d-38260be676emr11625227f8f.54.1732521915492; 
 Mon, 25 Nov 2024 00:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+by0dU2iwf5y1vPGKGQKWOGXE4oXRIyDvEk2R/g0VnuYUlBUxcDgP9a4Y0uJK5Oyf1bFq1A==
X-Received: by 2002:a5d:64e4:0:b0:382:4edb:19c7 with SMTP id
 ffacd0b85a97d-38260be676emr11625192f8f.54.1732521914995; 
 Mon, 25 Nov 2024 00:05:14 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad641fsm9590466f8f.20.2024.11.25.00.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/8] rust: qom: rename Class trait to ClassInitImpl
Date: Mon, 25 Nov 2024 09:05:01 +0100
Message-ID: <20241125080507.115450-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125080507.115450-1-pbonzini@redhat.com>
References: <20241125080507.115450-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VtYeT60cRwOJ6Dk7-JnPRszhm__GMoZXNh5RB1fLxgU_1732521916
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:27 -0000

While at it, document it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  4 ++--
 rust/qemu-api/src/definitions.rs | 25 ++++++++++++++++++++++---
 rust/qemu-api/tests/tests.rs     |  4 ++--
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index f47e0f48d8a..763605d4776 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -117,7 +117,7 @@ pub struct PL011Class {
     _inner: [u8; 0],
 }
 
-impl qemu_api::definitions::Class for PL011Class {
+impl qemu_api::definitions::ClassInitImpl for PL011Class {
     const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
         Some(crate::device_class::pl011_class_init);
     const CLASS_BASE_INIT: Option<
@@ -650,7 +650,7 @@ pub struct PL011LuminaryClass {
     }
 }
 
-impl qemu_api::definitions::Class for PL011LuminaryClass {
+impl qemu_api::definitions::ClassInitImpl for PL011LuminaryClass {
     const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
         None;
     const CLASS_BASE_INIT: Option<
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 92b3c6f9118..3291f4242ce 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -20,8 +20,27 @@ pub trait ObjectImpl {
     const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
 }
 
-pub trait Class {
+/// Trait used to fill in a class struct.
+///
+/// Each QOM class that has virtual methods describes them in a
+/// _class struct_.  Class structs include a parent field corresponding
+/// to the vtable of the parent class, all the way up to [`ObjectClass`].
+/// Each QOM type has one such class struct.
+///
+/// The Rust implementation of methods will usually come from a trait
+/// like [`ObjectImpl`].
+pub trait ClassInitImpl {
+    /// Function that is called after all parent class initialization
+    /// has occurred.  On entry, the virtual method pointers are set to
+    /// the default values coming from the parent classes; the function
+    /// can change them to override virtual methods of a parent class.
     const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)>;
+
+    /// Called on descendent classes after all parent class initialization
+    /// has occurred, but before the class itself is initialized.  This
+    /// is only useful if a class is not a leaf, and can be used to undo
+    /// the effects of copying the contents of the parent's class struct
+    /// to the descendants.
     const CLASS_BASE_INIT: Option<
         unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void),
     >;
@@ -82,8 +101,8 @@ macro_rules! type_info {
             instance_finalize: <$t as $crate::definitions::ObjectImpl>::INSTANCE_FINALIZE,
             abstract_: <$t as $crate::definitions::ObjectImpl>::ABSTRACT,
             class_size:  ::core::mem::size_of::<<$t as $crate::definitions::ObjectImpl>::Class>(),
-            class_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::Class>::CLASS_INIT,
-            class_base_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::Class>::CLASS_BASE_INIT,
+            class_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::ClassInitImpl>::CLASS_INIT,
+            class_base_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::ClassInitImpl>::CLASS_BASE_INIT,
             class_data: ::core::ptr::null_mut(),
             interfaces: ::core::ptr::null_mut(),
         };
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index f793ff26e5d..704c63c846f 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -7,7 +7,7 @@
 use qemu_api::{
     bindings::*,
     c_str, declare_properties, define_property,
-    definitions::{Class, ObjectImpl},
+    definitions::{ClassInitImpl, ObjectImpl},
     device_class, device_class_init,
     zeroable::Zeroable,
 };
@@ -60,7 +60,7 @@ impl ObjectImpl for DummyState {
         const PARENT_TYPE_NAME: Option<&'static CStr> = Some(device_class::TYPE_DEVICE);
     }
 
-    impl Class for DummyClass {
+    impl ClassInitImpl for DummyClass {
         const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
             Some(dummy_class_init);
         const CLASS_BASE_INIT: Option<
-- 
2.47.0


