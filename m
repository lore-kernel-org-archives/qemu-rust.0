Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU6V-0004v5-1C
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU66-0004oD-05
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU63-0007Is-Gd
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gv7CRYSGxzo9Mp91cBsW0yHPaWpXNZXh+VQtxbDWVCM=;
 b=Qo0mkqS/QjZ/J5nRRzEC57Wm1QbKuHr5xkhSX7ZR9D2guVtySvSCQKLRL85xEghRo5xHAF
 cY01mudmX21OIbq6NnM9ktN7xjiV2o7zK618RwBE/a5ocQ20II1vY/hl1Soe8MLWVBJBnq
 Vg5srYJzt17ekFpD8EFIwxZqfOc3D+0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-744pF0dZP6G6Lf2LUAOMbw-1; Mon, 25 Nov 2024 03:05:22 -0500
X-MC-Unique: 744pF0dZP6G6Lf2LUAOMbw-1
X-Mimecast-MFC-AGG-ID: 744pF0dZP6G6Lf2LUAOMbw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434a0d30c06so1658535e9.1
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521921; x=1733126721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gv7CRYSGxzo9Mp91cBsW0yHPaWpXNZXh+VQtxbDWVCM=;
 b=EZqvco7d06ZC6JytwTq08Gl3G5oMY7calTaJVIPhfQi34QgPOTfJ9MLgXlNNXmqzmL
 36FEqTCPzKNiBiRr/x5J08fKNMKXWqam1ljLzbPYXSFB+DZihEWGqQD0aLppHPUvJ6hi
 NZ1pyWcA7zqd0kgd+tp/u3u52l0wCphV5YXgy94Y341MPqFSU/raZ0xHk/VaRKRhOVcs
 0dTLUMbFR1hfbNg3VZ7JujSbv220o3Vt99QIlGPt1+rcohzS3lErswh27NtInG+R+oyL
 vqxKekwjWoi4Hzm5QO49L3mgZ9ivnxlcZsMExgVryJt9ij94enaHyiSP53qnG8GTe49C
 4p0A==
X-Gm-Message-State: AOJu0Ywym1mkFXAkrfWzFZyPAz54TnrpaarHGmcNLAZpo+lSoxh83Plz
 PILIEIYIaYaMaZw2dZQ0M5Gm9hMScu+yWkqLVBtnWYgqj1A6yfUxZhaC7rkC+qIyj0P7/Hn1Ibb
 YAFU4RrtaXqsCaXJHWC5OCl+pM1/XwGr1z+E3XBdys/k3mZ17jqu1pA7bRHk=
X-Gm-Gg: ASbGnctiiPYIQ7l9Jh8hlY1KGmbhpPZ9byaQpsDOrVjks6BXoBGPyARJkLq3HFVQSQa
 /hfyfn0XEHOwg00dNLYOMDoAiQlyiR3bgRVuL46ASljoaJ7ZGQ9RZkDaA/q11pwvm7gkMLpQeOi
 f9wwYNAhiWsM7o5333af+Rkq/bbUTHvaEPnKBtbZwgq2JpCzwaglS/ByDA6L2eQkdaxUfkcEdxe
 ck+d3kN8uIUfOjWVhAwFtfRr0Kh2s9bvhPZ8zR8ssUR7th4HyMc7ME=
X-Received: by 2002:a5d:6f1d:0:b0:382:49c0:131a with SMTP id
 ffacd0b85a97d-38259cb7f74mr13493984f8f.1.1732521921055; 
 Mon, 25 Nov 2024 00:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFzwMDdJB5NpLdWmINSf45Vin7xxIQ1Xjnp7zSPv2wYUryZH/iv6GkRrLAlG2kHOqWFLaKzA==
X-Received: by 2002:a5d:6f1d:0:b0:382:49c0:131a with SMTP id
 ffacd0b85a97d-38259cb7f74mr13493954f8f.1.1732521920752; 
 Mon, 25 Nov 2024 00:05:20 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbed9a8sm9574835f8f.92.2024.11.25.00.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/8] rust: qom: move ClassInitImpl to the instance side
Date: Mon, 25 Nov 2024 09:05:03 +0100
Message-ID: <20241125080507.115450-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125080507.115450-1-pbonzini@redhat.com>
References: <20241125080507.115450-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tmUfv86Nuiw-gRXPky2RCfRh8NQsSFCpLpksr1z5NG4_1732521921
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.93,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:33 -0000

Put all traits on the instance struct, which makes it possible to reuse
class structs if no new virtual methods or class fields are added.
This is almost always the case for devices (because they are leaf
classes), which is the primary use case for Rust.

This is also simpler: soon we will find the implemented methods without
macros, and this removes the need to go from the class struct to the
instance struct to find the implementation of the *Impl traits.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 4 ++--
 rust/qemu-api/src/definitions.rs | 8 ++++----
 rust/qemu-api/tests/tests.rs     | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index f050a332170..21d86b41f2e 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -116,7 +116,7 @@ pub struct PL011Class {
     _inner: [u8; 0],
 }
 
-impl qemu_api::definitions::ClassInitImpl for PL011Class {
+impl qemu_api::definitions::ClassInitImpl for PL011State {
     const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
         Some(crate::device_class::pl011_class_init);
     const CLASS_BASE_INIT: Option<
@@ -649,7 +649,7 @@ pub struct PL011LuminaryClass {
     }
 }
 
-impl qemu_api::definitions::ClassInitImpl for PL011LuminaryClass {
+impl qemu_api::definitions::ClassInitImpl for PL011Luminary {
     const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
         None;
     const CLASS_BASE_INIT: Option<
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 6ecfaf51b09..487712611f6 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -9,8 +9,8 @@
 use crate::bindings::{Object, ObjectClass, TypeInfo};
 
 /// Trait a type must implement to be registered with QEMU.
-pub trait ObjectImpl: Sized {
-    type Class: ClassInitImpl;
+pub trait ObjectImpl: ClassInitImpl + Sized {
+    type Class;
     const TYPE_NAME: &'static CStr;
     const PARENT_TYPE_NAME: Option<&'static CStr>;
     const ABSTRACT: bool = false;
@@ -32,8 +32,8 @@ pub trait ObjectImpl: Sized {
         instance_finalize: Self::INSTANCE_FINALIZE,
         abstract_: Self::ABSTRACT,
         class_size: core::mem::size_of::<Self::Class>(),
-        class_init: <Self::Class as ClassInitImpl>::CLASS_INIT,
-        class_base_init: <Self::Class as ClassInitImpl>::CLASS_BASE_INIT,
+        class_init: <Self as ClassInitImpl>::CLASS_INIT,
+        class_base_init: <Self as ClassInitImpl>::CLASS_BASE_INIT,
         class_data: core::ptr::null_mut(),
         interfaces: core::ptr::null_mut(),
     };
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 7f9df348b00..fd0c979121c 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -59,7 +59,7 @@ impl ObjectImpl for DummyState {
         const PARENT_TYPE_NAME: Option<&'static CStr> = Some(device_class::TYPE_DEVICE);
     }
 
-    impl ClassInitImpl for DummyClass {
+    impl ClassInitImpl for DummyState {
         const CLASS_INIT: Option<unsafe extern "C" fn(klass: *mut ObjectClass, data: *mut c_void)> =
             Some(dummy_class_init);
         const CLASS_BASE_INIT: Option<
-- 
2.47.0


