Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiE2-0001s0-TO
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDx-0001qT-8O
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDv-00083Z-Oa
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CL3TI60x6PujqVqUZyFN6Jp1dFCTcnvDg29W8z5vXdA=;
 b=MsxnZrbUTh9QInjlKD5vf4GhEJCoiul3dqgrWmyGjtH+Sf8n0kE75FPP4Le127iBHINsMn
 DH1CSND5CS7fDMIfdvau3Dk/gR7+hIlyd/kFRbqEyi+lvVYl1as65DlGmcDhyRAZg22F1a
 lkuk4DJrYlPMfAN8wAQI8rsFmgd91o0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-9UCXzVJ0MCuUHv2HYho6qQ-1; Fri, 17 Jan 2025 04:01:01 -0500
X-MC-Unique: 9UCXzVJ0MCuUHv2HYho6qQ-1
X-Mimecast-MFC-AGG-ID: 9UCXzVJ0MCuUHv2HYho6qQ
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab2b300e5daso238023566b.1
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104460; x=1737709260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CL3TI60x6PujqVqUZyFN6Jp1dFCTcnvDg29W8z5vXdA=;
 b=mKHPlcoC86kTSAABum+igmunb8sUk9sZrB7JfJGtM2GateJ/Az9Q1wuD66L7u5FjG1
 yOqMjQo4T08AgKC4fCtO9lJLipBSfaYRQtnU3y1RUlnIRmZnC/l0yKc7/LJbqaEUAV3j
 BSfeKf0ujV3hUsVYG8QxXfr+Ibj41NMfMmoj2rhzlDH8VPkJNTkmoqFdKztK7f03QNUR
 RI+AI0JDDdqpfQlXBIbvTuSZH/g8/S+2wf7qPTEU1czqESgxmgE+qLFxOPyoj0sUlWMt
 WwNQuG1ew702QP24zczEzv2727yHFyhkEeTk1otVTk3AqHgAAhtzvYOf2oGjHUKa+Oc/
 QRIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj6bQTp3dSlWOkLVlSCfVwKrV9gJrWN0LGMQX0OTyH22NOn+7BQeAED4c75d0bSrKhgpOo+U6rcl4=@nongnu.org
X-Gm-Message-State: AOJu0Yw5/S7JlBzRCCBvO/oXNHfJTa7gsJBfjMrYFK9N1Pfdu+lAucYg
 ZTj2rPWvfE0SzIjOUQeNekx4/orV3ESmUl3hLMuepOtWvGo9oCTuXq78Kiyk4yjaahRzHOdm3fq
 sJhgZVqu7XLz6tLaq8zW/2IycXxVkVhk7CkRuWF+12r3KEbCOMc8=
X-Gm-Gg: ASbGnctEX94Ojh3yFO5b8M68e/dcy1YgDtdutrT+gtGVmM6/kMw8EqVOcXfpjl4tfVY
 q7klYN185bqc00dMRL855qTTdf8ryl08wrVRTow0g7mMaKl8O2H5xf+uZRFA5YlwcBaWKVuUzik
 l/I/jq44aENT95Mzgv/hK1yCM4xRC5kxzH2NZ6T/TG//Mqwwan4Kn36BMU6HhnuV4dFd0sc8ROH
 lZXONGiyNoYmnlk/ahPU3A43cYVs+CRhTEDKydKLw7Fq8jwJJsVOze3HQyF
X-Received: by 2002:a17:907:d1b:b0:aab:cd45:5d3c with SMTP id
 a640c23a62f3a-ab38b3c7729mr176995666b.50.1737104460435; 
 Fri, 17 Jan 2025 01:01:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2xtuKFEQyhaT4qfnZUOyLzwjzCVzPWwIpe1FuAD/FuO/UZ04ZG/uqpK/6mcmqh86Kf+OsDA==
X-Received: by 2002:a17:907:d1b:b0:aab:cd45:5d3c with SMTP id
 a640c23a62f3a-ab38b3c7729mr176992666b.50.1737104460026; 
 Fri, 17 Jan 2025 01:01:00 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce208fsm137249466b.65.2025.01.17.01.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:00:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 04/10] rust: vmstate: implement Zeroable for VMStateField
Date: Fri, 17 Jan 2025 10:00:40 +0100
Message-ID: <20250117090046.1045010-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: clSxCkJV4oHl9hwM6UEk6eFim8NGUBh3oiugn2VadWk_1737104460
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:06 -0000

This shortens a bit the constants.  Do not bother using it
in the vmstate macros since most of them will go away soon.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs  | 18 +++---------------
 rust/qemu-api/src/zeroable.rs | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 3c3ed8510ab..22a5ed50d4a 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -21,8 +21,8 @@
 
 use core::{marker::PhantomData, mem, ptr::NonNull};
 
-use crate::bindings::VMStateFlags;
 pub use crate::bindings::{VMStateDescription, VMStateField};
+use crate::bindings::VMStateFlags;
 
 /// This macro is used to call a function with a generic argument bound
 /// to the type of a field.  The function must take a
@@ -503,20 +503,8 @@ macro_rules! vmstate_fields {
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


