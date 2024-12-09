Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd37-0005dJ-0I
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1Z-000421-JZ
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1X-0007V4-MF
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQQh40wwBPdVycCz9xzGGWLkoYV4qfuAlbHWnwDiqjM=;
 b=BnzRaaNxCggmbfosvkXCR7NuSY2R7iYfHuyubQWZ2cyfkA+qwLqcENfgEAS60vBo5U5FFK
 s84gSshpJ5q0W5G4QnbiizDTvBoJj3/yqFMaMTCTAN6DsEFmxjBWV3MJLdG7VFQfen5iKR
 l7BRUi83a4UyLSBfwlcw6GdBnc/O3EU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-nMD5lLCwORmxiNiRbDZ_4Q-1; Mon, 09 Dec 2024 07:38:00 -0500
X-MC-Unique: nMD5lLCwORmxiNiRbDZ_4Q-1
X-Mimecast-MFC-AGG-ID: nMD5lLCwORmxiNiRbDZ_4Q
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385df115300so2516900f8f.2
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747879; x=1734352679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQQh40wwBPdVycCz9xzGGWLkoYV4qfuAlbHWnwDiqjM=;
 b=l7OBUfU49K98auhA+rsEr/GgPpkaiplVlAxPtN8PvfoNhZns95eFeolK2N+Qg11OKm
 VZPbu58Y1Suu7Cm0BJCOV2QETCS/t/SyO0O0+2Lmr9VCrlkanF9x6wOD+4ENpXTuNHUO
 cfpeKvv2fkHt70/HrzYi4UGmedbRki0HUDFW+vG6ATd737qb8PJLzuuAf0eEjjH2sdkA
 jyC6TNKZO6xqPtyFQr17lQz0GPY5xPH36n57+qfFZ2l/Tcmk2FK7lgYxuJKwjDDWIdnN
 RyOhzQWAvsPV4ge30RjE9Yh9FOq3Bq6xracPArveM6+c2+ong7pjdo6qSQ/BER//m15E
 jGWg==
X-Gm-Message-State: AOJu0YyNhrKomk6YmYduaHisssEqoAdpMBmLYJXeQC2YM5yb+kp9PS8t
 lDQ0ANppDmUYaK6dBlb+wFdjv0ZdDJMq294N4Wh0Lzriin5Jf1WPFvmQZ2rwODesFtLBnKTcSMA
 rlrN3NFm3FRwmJUwZyRRDTNQqzvoJFpkxVLwmjWZj06ozkRcX7Eo=
X-Gm-Gg: ASbGnctsefvA4K8VmIvGDiHOnYt27EVBNYibrL4Q/WNRpK0xYPTXhami452G99xyqkV
 r5Nj+QMZqtJ9xxCH2efXg15Op65lrkyuv0U9UknNDAxMJtuVGUvEgWw0zAo45H1d9xJUI9fdAsD
 IxHMPHOIZEBgI2D7Y0qgoSF267ZOPO6sIU3MMqAV0Bhdo3oHvttLOvUiiO9BKXozW9D3kcz42wD
 CCOVpF4aPIxVi5DqLkYP3ogGI3nf4PnfjHS6Oq2OvU6sIUY9940EA==
X-Received: by 2002:a05:6000:144a:b0:385:f8bd:6e80 with SMTP id
 ffacd0b85a97d-3862b3e4458mr10190695f8f.56.1733747878720; 
 Mon, 09 Dec 2024 04:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzFTifBSYSzW3fJ6voGMUSVISIXLUfyNsk7svSndINudfaxbHG86MfKOEGzZf1d1Bacsuo1w==
X-Received: by 2002:a05:6000:144a:b0:385:f8bd:6e80 with SMTP id
 ffacd0b85a97d-3862b3e4458mr10190680f8f.56.1733747878378; 
 Mon, 09 Dec 2024 04:37:58 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf4119sm12925315f8f.14.2024.12.09.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 16/26] rust: qom: change the parent type to an associated type
Date: Mon,  9 Dec 2024 13:37:07 +0100
Message-ID: <20241209123717.99077-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AdKCGPR8qZ_zmnxUoPNVU7ZJurxwsGiKwhfa65hThrY_1733747879
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
X-List-Received-Date: Mon, 09 Dec 2024 12:38:11 -0000

Avoid duplicated code to retrieve the QOM type strings from the
Rust type.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 6 ++++--
 rust/qemu-api/src/definitions.rs | 8 ++------
 rust/qemu-api/tests/tests.rs     | 3 +--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 0ab825b1ca4..3e29442a625 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -113,7 +113,8 @@ unsafe impl ObjectType for PL011State {
 }
 
 impl ObjectImpl for PL011State {
-    const PARENT_TYPE_NAME: Option<&'static CStr> = Some(<SysBusDevice as ObjectType>::TYPE_NAME);
+    type ParentType = SysBusDevice;
+
     const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
 }
 
@@ -650,7 +651,8 @@ unsafe impl ObjectType for PL011Luminary {
 }
 
 impl ObjectImpl for PL011Luminary {
-    const PARENT_TYPE_NAME: Option<&'static CStr> = Some(<PL011State as ObjectType>::TYPE_NAME);
+    type ParentType = PL011State;
+
     const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
 }
 
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 1c412dbc876..1975ad91867 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -57,7 +57,7 @@ pub unsafe trait ObjectType: Sized {
 pub trait ObjectImpl: ObjectType + ClassInitImpl {
     /// The parent of the type.  This should match the first field of
     /// the struct that implements `ObjectImpl`:
-    const PARENT_TYPE_NAME: Option<&'static CStr>;
+    type ParentType: ObjectType;
 
     /// Whether the object can be instantiated
     const ABSTRACT: bool = false;
@@ -76,11 +76,7 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl {
 
     const TYPE_INFO: TypeInfo = TypeInfo {
         name: Self::TYPE_NAME.as_ptr(),
-        parent: if let Some(pname) = Self::PARENT_TYPE_NAME {
-            pname.as_ptr()
-        } else {
-            core::ptr::null_mut()
-        },
+        parent: Self::ParentType::TYPE_NAME.as_ptr(),
         instance_size: core::mem::size_of::<Self>(),
         instance_align: core::mem::align_of::<Self>(),
         instance_init: match Self::INSTANCE_INIT {
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 1be03eb685c..2a72b0f9276 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -53,8 +53,7 @@ unsafe impl ObjectType for DummyState {
     }
 
     impl ObjectImpl for DummyState {
-        const PARENT_TYPE_NAME: Option<&'static CStr> =
-            Some(<DeviceState as ObjectType>::TYPE_NAME);
+        type ParentType = DeviceState;
         const ABSTRACT: bool = false;
     }
 
-- 
2.47.1


