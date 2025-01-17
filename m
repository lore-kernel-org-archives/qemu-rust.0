Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiEE-0001wG-8G
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiEB-0001uP-G9
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiE8-00084t-CS
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0eYY5eNnWTT8Na4EOEM5TaLYcFyvLxA//Me2yYZ88AI=;
 b=HtLBrC9aGhZn8kNjzjCftv7dMd7FLwEizr+kPfejzO6S4IWUXQMSBQBKyZzB+smLMU9+gf
 VVtgUdCBTcnoTwUfjUjasz2wz0/I6Vr2NUcS5rLKsQgGi69x70uv1Q9elpoaDN9feX2js0
 gcpkMCwFLmEUeza+Ec1ln9k7v/YdDDY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-rmkT21FtPn2BbUCTwEhmTQ-1; Fri, 17 Jan 2025 04:01:10 -0500
X-MC-Unique: rmkT21FtPn2BbUCTwEhmTQ-1
X-Mimecast-MFC-AGG-ID: rmkT21FtPn2BbUCTwEhmTQ
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa69c41994dso130739766b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104469; x=1737709269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0eYY5eNnWTT8Na4EOEM5TaLYcFyvLxA//Me2yYZ88AI=;
 b=WuxQJAH+1JEsObzzBrt3Fzvq8mE7qBSvubnfNjSJDf0pSC6vxa/vjcWHWzhIQquEVT
 ESvoBUb4pdROHyL3KTbAI14/Kx+QLsRnIH1lMpp/QVDiiS3WylDYP10ex4PdGbOPwHUK
 T1UzAV8PCHSeLXu0zXYq+m3sIjjPKcOYvfOr5lG9ATkMy78joIPfV6Gb8xtJEVN09atC
 3LLmd8myrj4kV4SHTTnuNvCQMfejbL3SshgnF8PxDWKH1Tny2X3JhNj/UuDTyAAe6XKZ
 NB6pIUR3gPtmevjA9qMnFLkM5KBnlYeVwp16usGr/nbohk/sJmhKR17GZibCTOz/8wGq
 NroQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsbNBzyfvU+Eq1y8FcuDQa0bjA/t8XkVyMl6RXhbleyxW1Nt/WOxs+qATLV6x4KEId9nlgOmw58E8=@nongnu.org
X-Gm-Message-State: AOJu0YwYYX+ZwUs7PSWj0QAq9Mlvp9b/KUeht8jA1G4CUU99Hx1RMl5R
 4vxunCGu+6nzL/CPW49JB+4/KGRTUkV4E4QFE7SZTP7Rt1uH6KKvCAKnWJGPlWNl/GuEBSxdFA2
 j6EOY6rSLu6HBVUTzOZPTi5pOlVzux8Jsn895nmlD/75Pah5mMQU=
X-Gm-Gg: ASbGncuT9ZnbNTfeoOzdAjjGFxzPz/FkuJnYu9dKpHfMCtK5iCqAnf04mGWeDGNxUt/
 BWXwhkpd9MAkz5HUQsARry22HFlBuhM0gCvnfOMrqE7+C8sOs8mrFfeyz759TlEubosraxwzq03
 IA/+4zU38KUqrP5mhtFa+x1yGPlUWeQnBrWJK4ifz3FdzskoL0X3amiizVO62v/7rPwbPS8ZUvn
 BkDdEkiYXz1hzA3HT/w2JrXISWrEZe/JW9pLHOjJQZUPB4jIDLZdBZWE6NaEBBPpIq5c9Sjdg==
X-Received: by 2002:a05:6402:518d:b0:5d0:ed92:cdf6 with SMTP id
 4fb4d7f45d1cf-5db7d30114amr3798781a12.19.1737104469072; 
 Fri, 17 Jan 2025 01:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSTfN0PC8UGWM2PPeDtDBZUuiUqq+gLt/lv4Iz/gcM/WQEzHZWsLe/ftmEPpF/FM3io9g/Qw==
X-Received: by 2002:a05:6402:518d:b0:5d0:ed92:cdf6 with SMTP id
 4fb4d7f45d1cf-5db7d30114amr3798684a12.19.1737104468117; 
 Fri, 17 Jan 2025 01:01:08 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f8d86esm135654166b.154.2025.01.17.01.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:01:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 07/10] rust: qemu_api: add vmstate_struct
Date: Fri, 17 Jan 2025 10:00:43 +0100
Message-ID: <20250117090046.1045010-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5nSj39uACzJ5FP0GzTl014BoQHXJfuzcsc80SMcjtLM_1737104469
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:20 -0000

It is not type safe, but it's the best that can be done without
const_refs_static.  It can also be used with BqlCell and BqlRefCell.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 8f32c72a0fd..94a2a29fe7e 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -628,6 +628,39 @@ macro_rules! vmstate_array_of_pointer_to_struct {
     }};
 }
 
+// FIXME: including the `vmsd` field in a `const` is not possible without
+// the const_refs_static feature (stabilized in Rust 1.83.0).  Without it,
+// it is not possible to use VMS_STRUCT in a transparent manner using
+// `vmstate_of!`.  While VMSTATE_CLOCK can at least try to be type-safe,
+// VMSTATE_STRUCT includes $type only for documentation purposes; it
+// is checked against $field_name and $struct_name, but not against $vmsd
+// which is what really would matter.
+#[doc(alias = "VMSTATE_STRUCT")]
+#[macro_export]
+macro_rules! vmstate_struct {
+    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:expr)?])?, $vmsd:expr, $type:ty $(,)?) => {
+        $crate::bindings::VMStateField {
+            name: ::core::concat!(::core::stringify!($field_name), "\0")
+                .as_bytes()
+                .as_ptr() as *const ::std::os::raw::c_char,
+            $(.num_offset: $crate::offset_of!($struct_name, $num),)?
+            offset: {
+                $crate::assert_field_type!($struct_name, $field_name, $type);
+                $crate::offset_of!($struct_name, $field_name)
+            },
+            size: ::core::mem::size_of::<$type>(),
+            flags: $crate::bindings::VMStateFlags::VMS_STRUCT,
+            vmsd: unsafe { $vmsd },
+            ..$crate::zeroable::Zeroable::ZERO $(
+                .with_varray_flag($crate::call_func_with_field!(
+                    $crate::vmstate::vmstate_varray_flag,
+                    $struct_name,
+                    $num))
+               $(.with_varray_multiply($factor))?)?
+        }
+    };
+}
+
 #[doc(alias = "VMSTATE_CLOCK_V")]
 #[macro_export]
 macro_rules! vmstate_clock_v {
-- 
2.47.1


