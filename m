Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3B-0003Oa-Re
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3A-0003Ne-Hg
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ36-0001yP-Ne
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLRyhLZCkB8ac2Pq1tt07simH7oDZNcXTrRpW5qQGiA=;
 b=UmEYOr/6AVTqWjwhgqQha2lsDMltUAkeiSOutgDMSMfPQeumrXxLewoLlZZcJtwnVbT0iU
 iSQ8X4IiOz9MqhKsiCN7gJREkrtfGPfShcENYsb69LEta/cTt+BN/PFLdCz941rrpBcN92
 mYxxbejoNFsPfAKIfqg8sOWBlE7hqVA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-5ck9JcZ4Oy6Cfg3bZehVdQ-1; Mon, 30 Dec 2024 19:23:50 -0500
X-MC-Unique: 5ck9JcZ4Oy6Cfg3bZehVdQ-1
X-Mimecast-MFC-AGG-ID: 5ck9JcZ4Oy6Cfg3bZehVdQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e00ebb16so1296285f8f.3
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604629; x=1736209429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLRyhLZCkB8ac2Pq1tt07simH7oDZNcXTrRpW5qQGiA=;
 b=hhu0acdI7b1+qgK2mhAKas4fORh4TZCpNDGdj/cUfkbLw4R4P64vERVsvdecE2/gH8
 04VzgMQzmw93g/ZnUBR60afffabxADkZSPqbls57MtUpZpxH7Evi5y+Zf6dOfQBfFpPc
 6Wjes59Fev6yrB+Ur44+9laW2DY5hGs1G5rLBuT3qHWIY/MBHFrm2o0F2biXCaveNrot
 ujZ9Ubjr2iNys0vIuH6o0yDhAvW51d/Z7SiE7zWmVuzZNvJx992zBvpGwGZ05y075uPr
 IhlvJYBK9eQQOkZGgEsSyrbcRGkPwa6KHOFn+cfmB/IHcsqA4ZGVbgULQLfPfiKuTTRF
 VUmg==
X-Gm-Message-State: AOJu0YxKGtN9oPeTQ2MxEwqTOMwq3w8qW/LUnxusSMaQ4X35rfFueW9n
 DXRlMorYhju6K3/vm4njed9Qr7RGa81IWeOW5CUlsWzvCTb/iRj4jiRrHDVM9DL/dMYFDZh1r1j
 lNs/ghxjCbvb8LDk+/vl0r6oMDOyPISOhz8v5gCAGX08RQWDyU5S/NOzIbH7BAA==
X-Gm-Gg: ASbGnct4FCBcZEAlBnnQvV5og0n8+KN/iWmzmqL9l2RQg6CmnvWgCuxJlvlzVEizQpk
 74HydJIKRqbGgu9sqJQ5YlPymr00dIg8O3zdZPgbSIcbhC5BhKJKLy1fdzUDnePHOcKMFtND4/0
 El5H5BKeJ/Fp3Zf63VA2vZa7VzTiE16Xp9mc2UlWT6wyZPqpE4Y7I59rmLiMCrw0ZU+AL2toupD
 OZ81vB6dxdbKpRJikrcIj+E583eNzJvLonON0z0mL4MlHZ8RkAioSjoh5U=
X-Received: by 2002:adf:a19b:0:b0:38a:418e:21c7 with SMTP id
 ffacd0b85a97d-38a418e22c3mr14300666f8f.53.1735604629212; 
 Mon, 30 Dec 2024 16:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPSSd6h75+IGdiryn3rjZa15qMs3HnUtJ0l0Tv4kKFN5rJ1pSZQBZ70HWW88GqUGQEv/F1Pw==
X-Received: by 2002:adf:a19b:0:b0:38a:418e:21c7 with SMTP id
 ffacd0b85a97d-38a418e22c3mr14300657f8f.53.1735604628829; 
 Mon, 30 Dec 2024 16:23:48 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e26csm31849972f8f.78.2024.12.30.16.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 4/9] rust: vmstate: implement Zeroable for VMStateField
Date: Tue, 31 Dec 2024 01:23:31 +0100
Message-ID: <20241231002336.25931-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rJwUXhKwuKpGKoxF6gV8pIiciuhGkq2UdLxR-gM_mxw_1735604630
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:23:56 -0000

This shortens a bit the constants.  Do not bother using it
in the vmstate macros since most of them will go away soon.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs  | 18 +++---------------
 rust/qemu-api/src/zeroable.rs | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 079c19c687b..49d0a3c31d4 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -21,8 +21,8 @@
 
 use core::{marker::PhantomData, mem, ptr::NonNull};
 
-use crate::bindings::VMStateFlags;
 pub use crate::bindings::{VMStateDescription, VMStateField};
+use crate::bindings::VMStateFlags;
 
 /// This macro is used to call a function with a generic argument bound
 /// to the type of a field.  The function must take a
@@ -488,20 +488,8 @@ macro_rules! vmstate_fields {
         static _FIELDS: &[$crate::bindings::VMStateField] = &[
             $($field),*,
             $crate::bindings::VMStateField {
-                name: ::core::ptr::null(),
-                err_hint: ::core::ptr::null(),
-                offset: 0,
-                size: 0,
-                start: 0,
-                num: 0,
-                num_offset: 0,
-                size_offset: 0,
-                info: ::core::ptr::null(),
-                flags: VMStateFlags::VMS_END,
-                vmsd: ::core::ptr::null(),
-                version_id: 0,
-                struct_version_id: 0,
-                field_exists: None,
+                flags: $crate::bindings::VMStateFlags::VMS_END,
+                ..$crate::zeroable::Zeroable::ZERO
             }
         ];
         _FIELDS.as_ptr()
diff --git a/rust/qemu-api/src/zeroable.rs b/rust/qemu-api/src/zeroable.rs
index 6125aeed8b4..57cac96de06 100644
--- a/rust/qemu-api/src/zeroable.rs
+++ b/rust/qemu-api/src/zeroable.rs
@@ -49,6 +49,37 @@ unsafe impl Zeroable for crate::bindings::Property {
     };
 }
 
+// bindgen does not derive Default here
+#[allow(clippy::derivable_impls)]
+impl Default for crate::bindings::VMStateFlags {
+    fn default() -> Self {
+        Self(0)
+    }
+}
+
+unsafe impl Zeroable for crate::bindings::VMStateFlags {
+    const ZERO: Self = Self(0);
+}
+
+unsafe impl Zeroable for crate::bindings::VMStateField {
+    const ZERO: Self = Self {
+        name: ptr::null(),
+        err_hint: ptr::null(),
+        offset: 0,
+        size: 0,
+        start: 0,
+        num: 0,
+        num_offset: 0,
+        size_offset: 0,
+        info: ptr::null(),
+        flags: Zeroable::ZERO,
+        vmsd: ptr::null(),
+        version_id: 0,
+        struct_version_id: 0,
+        field_exists: None,
+    };
+}
+
 unsafe impl Zeroable for crate::bindings::VMStateDescription {
     const ZERO: Self = Self {
         name: ptr::null(),
-- 
2.47.1


