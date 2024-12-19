Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOBy4-0004aC-67
	for mharc-qemu-rust@gnu.org; Thu, 19 Dec 2024 03:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tOBy2-0004ZO-Sn
 for qemu-rust@nongnu.org; Thu, 19 Dec 2024 03:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tOBy0-00058l-Ju
 for qemu-rust@nongnu.org; Thu, 19 Dec 2024 03:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734597187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfN/9GQVfhxdzR3tEbIrQoWnaMvt0ggSFeNUo7cpLhw=;
 b=PZGBWF7Nto8ZbsEWqumqRoWX1eCZHSF4mq6Pl12313aaIxAKFrd0KUlsorxbQA6hXJbWxB
 syApv4qrVfDm2e4Cjo5qWAE6XqOgeOTZhh/9ncc19okjrN1iOowJ1u8LVh/WMXRptNKTLD
 CHbb287WSBOnBXZaRfB4gaveHd0O6ZM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-pdKTy4ViPL6kV7WTzbYJgg-1; Thu, 19 Dec 2024 03:33:06 -0500
X-MC-Unique: pdKTy4ViPL6kV7WTzbYJgg-1
X-Mimecast-MFC-AGG-ID: pdKTy4ViPL6kV7WTzbYJgg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361ac607b6so4590675e9.0
 for <qemu-rust@nongnu.org>; Thu, 19 Dec 2024 00:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734597185; x=1735201985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfN/9GQVfhxdzR3tEbIrQoWnaMvt0ggSFeNUo7cpLhw=;
 b=AXXVZNVfmjDTaX5l8SrOPW6zY605Yc74Y5luEpmtJgmpOWZFNljuGaiTFVZe4WgZHd
 J6mItrNAWFavufqh4JOzMNZsIA0inOEaL9Vj/JDSKcc5czV+umaP+KXg9EZf3fpCb/b6
 4iGxZpXrzGVQuxdxtflkk37JgbT6ffYqoL1rdNIX8XjiaEJo/rQLIHBuPJks5vjgTwxC
 ASb9G6omrJcKYbTPNvx1XvvvEi2hAjy2V8d0oaOi9+bs56C3hqEJQb0XeB70a+SyGOQv
 dImjjqzhd/P2s7SDxjUq2xnN32ZR5UHtEG/Ovjw44X4b5h8MtKf6FgoUXwoZGh07Z4DM
 WN3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDM+kLvmCrzC2QjDhM2dINrJlvkf9jEl8zzYunKLPvwm78bYXcPHw4pPTZVt7qbaaDp6bydBScOb4=@nongnu.org
X-Gm-Message-State: AOJu0YxHhdC2NN5gRVl29N+Zsnnr0hGLhVKVQ2QnT3uS8Jho5vy//Tjk
 DmZ33LhXkr4YQtnV01DdeO1rKB1Ser4FGn7HeoGe/pCiYFnXjJjW8mzuLiSCtSGmoxBfsOHRy91
 fLwhgEdgKE+f3hJFUMu3urUPCncEKHgseE0QdkdmGqGtsH9XsGWivw37Qmk4=
X-Gm-Gg: ASbGnctjiljijKvhhVsB1ZFLy+fgqpzni4wQDDFpUhpHFOSRvx+kyoy81XTl9awddSY
 1CwTptI5mOag9IKgLH5IjovIV5eQ6QHtroxnCJy64/q0OC0BgRf981yjtSZ/7pkIEUX+t3kM8jH
 ZU7OT1VozmWRcEQX6v74id8IO5hIKNAtBd+hztegnMQ01FlZmdzmhJ4xinL9v82JPTaPcrwE3De
 BldtV9eZqdvmGT2H+vih1Oz/3KkivGa0g/wyFXdTAwEXe5MiM241ikc4TW6
X-Received: by 2002:a05:6000:4916:b0:386:37f5:99e7 with SMTP id
 ffacd0b85a97d-388e4d64938mr5959485f8f.33.1734597185015; 
 Thu, 19 Dec 2024 00:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6tZMVwBA7gyFZ5L/qy4qkPy8xuADDK7kUaGu2ZLlU02ZkIR5eJwLLWgmHCt5KQePV7L8Eow==
X-Received: by 2002:a05:6000:4916:b0:386:37f5:99e7 with SMTP id
 ffacd0b85a97d-388e4d64938mr5959455f8f.33.1734597184659; 
 Thu, 19 Dec 2024 00:33:04 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8add5asm964519f8f.107.2024.12.19.00.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 00:33:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-rust@nongnu.org
Subject: [PULL 17/41] rust/qemu-api: Use device_class_set_props_n
Date: Thu, 19 Dec 2024 09:32:04 +0100
Message-ID: <20241219083228.363430-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219083228.363430-1-pbonzini@redhat.com>
References: <20241219083228.363430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lzTAUl2nFMDNRpqLS7xn03HiQLHyMpuU26WF-QDaQEc_1734597185
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
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
X-List-Received-Date: Thu, 19 Dec 2024 08:33:11 -0000

From: Richard Henderson <richard.henderson@linaro.org>

This means we can update declare_properties to drop the
zero terminator at the end of the array as well.

Cc: qemu-rust@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://lore.kernel.org/r/20241216035109.3486070-18-richard.henderson@linaro.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/device_class.rs | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/src/device_class.rs b/rust/qemu-api/src/device_class.rs
index 03d03feee83..c98f0b2c7da 100644
--- a/rust/qemu-api/src/device_class.rs
+++ b/rust/qemu-api/src/device_class.rs
@@ -7,7 +7,6 @@
 use crate::{
     bindings::{self, DeviceClass, DeviceState, Error, ObjectClass, Property, VMStateDescription},
     prelude::*,
-    zeroable::Zeroable,
 };
 
 /// Trait providing the contents of [`DeviceClass`].
@@ -31,7 +30,7 @@ pub trait DeviceImpl {
     /// device.  Not a `const` because referencing statics in constants
     /// is unstable until Rust 1.83.0.
     fn properties() -> &'static [Property] {
-        &[Zeroable::ZERO; 1]
+        &[]
     }
 
     /// A `VMStateDescription` providing the migration format for the device
@@ -87,7 +86,10 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
             dc.vmsd = vmsd;
         }
-        bindings::device_class_set_props(dc, <T as DeviceImpl>::properties().as_ptr());
+        let prop = <T as DeviceImpl>::properties();
+        if !prop.is_empty() {
+            bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
+        }
     }
 }
 
@@ -134,7 +136,7 @@ macro_rules! define_property {
 macro_rules! declare_properties {
     ($ident:ident, $($prop:expr),*$(,)*) => {
         pub static $ident: [$crate::bindings::Property; {
-            let mut len = 1;
+            let mut len = 0;
             $({
                 _ = stringify!($prop);
                 len += 1;
@@ -142,7 +144,6 @@ macro_rules! declare_properties {
             len
         }] = [
             $($prop),*,
-            $crate::zeroable::Zeroable::ZERO,
         ];
     };
 }
-- 
2.47.1


