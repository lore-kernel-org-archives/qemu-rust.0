Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1Q-0003wo-8K
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1M-0003rw-Jj
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1E-0007Q3-PM
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/CuNDAf/h1lPd4tHb600O5eISjRNvbweuEs0GGCzf8=;
 b=X/agfe0S3WIA2BW3VorIKAJoIc3rq+nspfy2A3I50ps71bQ6tMdz08036rPaGRwY9Wdd/R
 LXF9dtinsV9OazFMq/MsmTN4bfc1mp6Ba1jHVyKaFoJHzxsFxgB0nqQWnPNRaSVu4PHa8W
 CcS7s3H7S59ZcuQVqzjkOhijyZwVeyI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-uDJ5vheqOA-XV0seeRHONQ-1; Mon, 09 Dec 2024 07:37:39 -0500
X-MC-Unique: uDJ5vheqOA-XV0seeRHONQ-1
X-Mimecast-MFC-AGG-ID: uDJ5vheqOA-XV0seeRHONQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434f7516bf2so4554245e9.1
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747857; x=1734352657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/CuNDAf/h1lPd4tHb600O5eISjRNvbweuEs0GGCzf8=;
 b=G/15KeXpbZwdtRO+55evq1lD1TfmbfmL5HCvn6wqnVaFHF7PDKJiqIVCQTB8ZPvvA6
 yO0073D0Oj8huD/TIip669+H0ndbhixblSdByuD/OdGOX5Ixe8F9L3HWLHDpwV9orduB
 ZPUCf2VJCcnFoMH04j33I8WJIRDCY24DZrddjWuUqW+BYYyLqfHMQsnphCaYrxjNih4p
 CyMiuSQTvMUy3p/XhBFTGhXZE5FU9P/A2YLa2AucQ+g68YTt+Wd77G8h4PwuSorVW4Hu
 OOypqTjlH4CDLMm8BaiCbyBFygwgiaaJWrkF9PXwbs9MjqVQkGZEsIFcX7CwwX1KV9Zm
 Pm/Q==
X-Gm-Message-State: AOJu0YwD4e4sNCeKy/X1HIqy/nxxAvUcOlKjE5pVyqZivJ6bAixKpYj8
 2/mFf5J6l3aAWK1cPrG3EL7wALLaa8wA5OtwLddOdYi52/EYi6oh5wkl25eXhBkrbAz+fuTGdDQ
 lTpa8bTAfvUjcHdA5qYEC+VddipUDCjjnQmVmND31QkEAmWEGrP9Bb8kmgeg=
X-Gm-Gg: ASbGnctHXdDUHyfblKVmgkP26kXPZYdttVuJkzXIkiQsyJ+M3IY0P8U4zuic0Jzgtys
 +4OiLN7wATSE1HZEQv/+n9aPwtkUQPNRPLGFxvducMd+W9MOC7BJAA1qsJ+Dm3E/M35IDIczkKy
 KdINez+FT8PXqCmbXH6feR3GDTkuV6UeVGPnfvCDp1gOHZzOnCv5k7EbRb2HPh8gyxKCdWIMhLr
 qNnY9xY1skTFzMzN2wMz1knXLIm+e/jtxruHhWG0OBhcTFG21Tj3w==
X-Received: by 2002:a05:600c:3b1e:b0:434:9d3c:31ec with SMTP id
 5b1f17b1804b1-434d92bf66amr121067925e9.10.1733747857674; 
 Mon, 09 Dec 2024 04:37:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKosmxVjsdlGtzG1n53ELAg0Tz6RFW8udLUmBqIrFlJPlfcQ6F4Dy5UXlW6uhM4cO07tODkg==
X-Received: by 2002:a05:600c:3b1e:b0:434:9d3c:31ec with SMTP id
 5b1f17b1804b1-434d92bf66amr121067765e9.10.1733747857319; 
 Mon, 09 Dec 2024 04:37:37 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0be4sm191423765e9.28.2024.12.09.04.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 07/26] rust: qom: add default definitions for ObjectImpl
Date: Mon,  9 Dec 2024 13:36:58 +0100
Message-ID: <20241209123717.99077-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sz4DKSIRDH_8NVmTNkgklO7Jf46xkvwYM6NRTlDvDiw_1733747858
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Remove a bunch of duplicate const definitions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 6 ------
 rust/qemu-api/src/definitions.rs | 8 ++++----
 rust/qemu-api/tests/tests.rs     | 4 ----
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index c5c8c463d37..3d173ae816d 100644
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
2.47.1


