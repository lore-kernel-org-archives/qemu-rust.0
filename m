Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1V-00040r-Hq
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1P-0003we-Qy
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1M-0007RX-Bj
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnI0niveAFX2WdKfqxklK+1Zt06kPSFJCN7eFa7HF+8=;
 b=PSNVN+JVu7P/GTQSPB2VHyeREiSiDzN2jDfpYzgxUktgGtWUD6lgfXqO4UqTl7I1rJvTKx
 6W8Av/OOmQqmjyXYrNvaqL2Ur3tqTuUmYejaXQowX7N35mtnipz4QqekpUbb+cCRw5Dzny
 07MZ9lmVihp9b1cSKiZ7Jiw/D6uOdGs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-NYYLzAHvPuKJL4frjpKqdw-1; Mon, 09 Dec 2024 07:37:45 -0500
X-MC-Unique: NYYLzAHvPuKJL4frjpKqdw-1
X-Mimecast-MFC-AGG-ID: NYYLzAHvPuKJL4frjpKqdw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385dcae001fso1568556f8f.1
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747864; x=1734352664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnI0niveAFX2WdKfqxklK+1Zt06kPSFJCN7eFa7HF+8=;
 b=mhH4bO9yWBvJu+u603qNKaX+Hu2KttuTk/01UhtPqpxhpdPY1G4i5u9K7N0Xt/qORO
 azPnDJP5dqiauNhhCLwMc9x2hyDBAbfz1aGiivGuzMf8aYsyLMmdJbsgRFL/JuUMZiNi
 wFvt6aaaBvzzSrBJ8FT+AmHq830nmD4PQxh/E1ShOXQTqWJiRjnIqHy0aNRCpj4XxJys
 dy8/ZMhazfUQOHQnh5LvxoJzJrLUf+WSDLB+M9CvhZx91KPN6TLdedKw/6eOBGJRTAT+
 ulwYsxHiBU6HjVa01N+VezSv8pFLWJtTgq7A0nVXR03T3iY2FyX4oZiB2R5Wqn0bFsRZ
 jiLg==
X-Gm-Message-State: AOJu0Yx0vYL1ce4Bmm8WqopOvm9wAtmG6avhCvlna3rvZypTfaLmsyLj
 ORHhQUKdVbxkLoh2tUALtkYtaSc0YXbEEnsgOAUYqjmyqEiTKanH+Ahd6AJSFFGuds9Vyou0ER1
 qDWhpcVa9grkQvwtZcjjB/SLCJsvopvWCTao6n2icHBANX0n6Wbg=
X-Gm-Gg: ASbGncugjSHg8XbYDytXDyqKYgcDvdAWV0egsufzG1cxv/aTH6YXzKZn3n2+CCssJ4H
 QB78CkyKFCPeftB8993DnlJ8eo8B+ESMcYjWu9z0mN1LFnK3Q7MSgNqrX9tJqD5PB7XbxFlldUb
 Yb5idh6ug+/0ew1Rfq4Th9Ei1+pBP25XyWF6HNX6rV8EPYa/P7DtqNIHjagkVkwGJAD29GAIGr0
 u7ZaMIUZu85R7c+IlrG4Li4HtEB4arK8PCBCp1McIbpeeui79cohA==
X-Received: by 2002:a5d:6c69:0:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-3862b33f0d1mr9303158f8f.8.1733747864275; 
 Mon, 09 Dec 2024 04:37:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaI5mpcGtPfQA/5tjvnqn4QZw2Pce8+RV3HgH+A6JNVqnFNEEY9kcB0+Ainpq7S21I/hgG8A==
X-Received: by 2002:a5d:6c69:0:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-3862b33f0d1mr9303141f8f.8.1733747863883; 
 Mon, 09 Dec 2024 04:37:43 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf40a0sm12875064f8f.13.2024.12.09.04.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 10/26] rust: qom: move ClassInitImpl to the instance side
Date: Mon,  9 Dec 2024 13:37:01 +0100
Message-ID: <20241209123717.99077-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jlxo8ebCuSFZcOQ5JAvMbqFiJjLaUNzj2C9xbVrF09k_1733747864
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:56 -0000

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
index bcb146c24d6..2384d4bcb95 100644
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
2.47.1


