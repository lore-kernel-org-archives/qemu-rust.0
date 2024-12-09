Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1S-0003yN-Ep
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1M-0003s2-LH
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1E-0007QH-Pd
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2ZIv/PAvz3komJwq6oypf8CScK5YKxPKfhuCNRvYs8=;
 b=acA8UT4FotS1i2dOXSIGaV3yHgo/Yf8L6IiA+JClz5YJ6ZMLU5ZWv28ZweFqz6THk0MtMn
 ye8RldovMF0eqlCE8lpmffJ+inI3kBowANgEr/RXsgfwbG6jPzqZfmQEONaBQTy6XtcPtm
 W8Uqf2xyuIoi6b5KwGPxgpJ10c4Wnx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-KxdHtn34Mw2psrHpTUcK2g-1; Mon, 09 Dec 2024 07:37:41 -0500
X-MC-Unique: KxdHtn34Mw2psrHpTUcK2g-1
X-Mimecast-MFC-AGG-ID: KxdHtn34Mw2psrHpTUcK2g
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434fff37885so669125e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747860; x=1734352660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2ZIv/PAvz3komJwq6oypf8CScK5YKxPKfhuCNRvYs8=;
 b=U98eGXH7QWf5Xlo/RiCgCzlQFi4w3vbih+zVD8i5VCvXIBqjoIwEFZB64ptjeAubDg
 jPPVPKrpkipOS0kd5D7rmfGIZ+7Vb4QV936AP9sVw+OAMCtO8vjeO0YBhUWr10zwstb3
 /MSMVTrv14117dylBO5GRDIfOkFGkNQfIW15O30j1R3T3uL3Klot7Ut3l0v1V4yJgCaH
 lgc5KgdTyyGffEUKlgCxUSxcrYizQOgb41uMv/0u8Jj684+qY0t9HrNYG/XpsnFyyz5X
 st5PjDFtbsoCej26ADjtBvOx5TuUb9c5HDiM1wlxUPrr7abDiQRbxzVtgcFozGWjlkP/
 Polw==
X-Gm-Message-State: AOJu0YzIE2T/taZyxoploJ/orn5gyTRQ+l55ZbztT9tZ8EL9NxvASYkb
 oY4FxisKBzi+nrzEtEVe9r1SLmeh99aGCDW0rvqeh36+gFlFYkscDCzLlimTCtBOXfcMCM6uKSd
 RkQkaGLFSpbtIyeNOPvENlRKosZYqOyRgeH+FtXcWniaOPD7T7xo=
X-Gm-Gg: ASbGncuJUTAs71hWj/FRNFOurb9rbK2l9Qb9Utqan/QSFfRJXNdKRDjWD1Nw4I0eADa
 2RgUJarhI7OIW/4D6xtFrUQodUDNDZwunJB1OgsXsLdnJjUqawGTSWVjCtt/dlBBnfuWhWUyJDk
 ONPkoQDHKEQ7ajtVeSqMlsKTUg1BSSXQrVPkNMfaIFSmIUpFng8Ye29UAe/Y7hdT+wki8VGLYZV
 6Eu9amxOMUHUIE7ZnXX3h67KpDvFUMxGN4wAENvJ6IIRXKP7d04Zg==
X-Received: by 2002:a05:600c:5108:b0:434:a7b6:10e0 with SMTP id
 5b1f17b1804b1-434fff80a6cmr2781095e9.18.1733747859724; 
 Mon, 09 Dec 2024 04:37:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTzrWqUo1UrlDef9gTX0dvO1xC+x7VjkryApIESqwOJvaVHc0eFXP98N3waTQkkhIbvtJ4BQ==
X-Received: by 2002:a05:600c:5108:b0:434:a7b6:10e0 with SMTP id
 5b1f17b1804b1-434fff80a6cmr2780875e9.18.1733747859365; 
 Mon, 09 Dec 2024 04:37:39 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d69dfsm153106035e9.14.2024.12.09.04.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 08/26] rust: qom: rename Class trait to ClassInitImpl
Date: Mon,  9 Dec 2024 13:36:59 +0100
Message-ID: <20241209123717.99077-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A57U83XXAS9ExiWuBEaYc3ff6WuFs6rmNeJZSUgwzTI_1733747860
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:53 -0000

While at it, document it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  4 ++--
 rust/qemu-api/src/definitions.rs | 25 ++++++++++++++++++++++---
 rust/qemu-api/tests/tests.rs     |  4 ++--
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 3d173ae816d..bd12067aaf0 100644
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
2.47.1


