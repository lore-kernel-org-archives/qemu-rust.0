Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU69-0004os-5V
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU60-0004nM-Ug
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU5v-0007H7-W5
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YzRwPCPqfMJAUUv5E85p/jUSPh5N41oWjEesEjecPY=;
 b=GXJ+nFaVT6Vw7WCCvzuEDE1zET4EkKijy04Pk8upaCEAVqm+WguLa3Tf6fEji6264/DpFW
 ZU4LhOT7HwiSrSZJaEtXg8vpAjmq3O5KdTJhaKI34mJlL+N6lMQYYbo3W1A5RVa+p6OFPy
 YyuMyobh8i6eFJGyT8elqBNlGa68eGo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-CQ3XWl6TOuufyyB8J5A2hQ-1; Mon, 25 Nov 2024 03:05:14 -0500
X-MC-Unique: CQ3XWl6TOuufyyB8J5A2hQ-1
X-Mimecast-MFC-AGG-ID: CQ3XWl6TOuufyyB8J5A2hQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4314a22ed8bso30052465e9.1
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521913; x=1733126713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YzRwPCPqfMJAUUv5E85p/jUSPh5N41oWjEesEjecPY=;
 b=E0nAmqB+QSKCBl8/noiz9PkgaxUH7T5wh+a0DQ4cETdr3fRbEu2FjKKMJt26OOph1i
 r81PQloA4x9aDuFPz5fIaOlRBeMf1k3Y5IZ/IqsnvRg5IPi/Sp68H9jf0w7k3C7H3u2o
 NeXY1rtpk87ErYNb+iBMJXh45w6C6lxZoIzJNhTzK8oggfZKyabJXv540/O5jy2AaYnZ
 0IZ+Ujh7GxdMgd7KbNv05aaOLJo4YVXzgw5Nms8Bo8+mUiZc35svMqswVr6wWREpW2Q6
 PAPgKhc4MZl7MYsjVRF3eE2Ya7ykfaZTLIS1oLEk45onJVeEFkDxPMRSWWRKp48b1Ypv
 oDMw==
X-Gm-Message-State: AOJu0YyCGJHabHvhwia8CcA8OwAq27rihnf41ZVQNYuomc4JqxAW8vYA
 Sdc3EmNKKBq7rlYF8lWqbfgpezfXq2jrMKb8H0w1E7zMCxkDiMVMAB8RJzUAeNM8Jh2WWF/mhs7
 Tk6kR1O4TJOAJYq2AGvRmSd1QrMyqOQ9kYe0tOcR/RdB19lxJ256px16Xnfk=
X-Gm-Gg: ASbGncv4/E7vqFPQL6Vog7BtRVV9VbfaP1imT5SDE5graV/uKt9y7uffgzrqH3uc36r
 cy2zz5ib1OYzeWFOKF1dlTO35bBC08qq5FK35CNOkLtmd1DAK1cNIYpuUUttJgjf9DUazsE/zyY
 VODkYHa2TP/rvgfCN4ws8hhIQfwiGLlH5au5fbRZZBt8kv0wEyAIteXveHpNEcvbjrPpNUuxaX4
 R3H700TWjvmX/q0xwv6uUyOuBxWe1XVbZpsgjJ+/JLYxwLf4t4gPHM=
X-Received: by 2002:a05:600c:1e8c:b0:434:a10f:c3 with SMTP id
 5b1f17b1804b1-434a10f016amr8175015e9.9.1732521912784; 
 Mon, 25 Nov 2024 00:05:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdwNws0+xZD9wCQ46zmqUvjw5T12MCZnWPB0Xl++eDA+C4gGqWo1XQ71HT6mBe8ZblRHa2rQ==
X-Received: by 2002:a05:600c:1e8c:b0:434:a10f:c3 with SMTP id
 5b1f17b1804b1-434a10f016amr8174835e9.9.1732521912458; 
 Mon, 25 Nov 2024 00:05:12 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434932dbc7esm68029535e9.37.2024.11.25.00.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/8] rust: qom: add default definitions for ObjectImpl
Date: Mon, 25 Nov 2024 09:05:00 +0100
Message-ID: <20241125080507.115450-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125080507.115450-1-pbonzini@redhat.com>
References: <20241125080507.115450-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HNPKhdlo8n9OAaaA3sbQeo0WxMUzgGBAjXrjjTjS9SU_1732521913
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:27 -0000

Remove a bunch of duplicate const definitions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 6 ------
 rust/qemu-api/src/definitions.rs | 8 ++++----
 rust/qemu-api/tests/tests.rs     | 4 ----
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 7e57634bba0..f47e0f48d8a 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -109,10 +109,7 @@ impl ObjectImpl for PL011State {
     const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(TYPE_SYS_BUS_DEVICE);
-    const ABSTRACT: bool = false;
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_init);
-    const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-    const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
 }
 
 #[repr(C)]
@@ -666,8 +663,5 @@ impl ObjectImpl for PL011Luminary {
     const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011_LUMINARY;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(crate::TYPE_PL011);
-    const ABSTRACT: bool = false;
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_luminary_init);
-    const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-    const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
 }
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 26597934bbd..92b3c6f9118 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -14,10 +14,10 @@ pub trait ObjectImpl {
     const TYPE_INFO: TypeInfo;
     const TYPE_NAME: &'static CStr;
     const PARENT_TYPE_NAME: Option<&'static CStr>;
-    const ABSTRACT: bool;
-    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)>;
-    const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)>;
-    const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)>;
+    const ABSTRACT: bool = false;
+    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
+    const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
+    const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
 }
 
 pub trait Class {
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 925f5a3c77b..f793ff26e5d 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -58,10 +58,6 @@ impl ObjectImpl for DummyState {
         const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
         const TYPE_NAME: &'static CStr = c_str!("dummy");
         const PARENT_TYPE_NAME: Option<&'static CStr> = Some(device_class::TYPE_DEVICE);
-        const ABSTRACT: bool = false;
-        const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-        const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-        const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
     }
 
     impl Class for DummyClass {
-- 
2.47.0


