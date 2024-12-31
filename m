Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3O-0003V3-Cu
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3M-0003UK-Q1
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3J-00020O-Rs
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uVl+dn480T+3VzLrS0d1h50fyBb5C28oZegz0tUkU0=;
 b=FXymHtQORSnRc0FOesML8BxtMTRNHm7k/7dngmQ8rEamoDqcJJ/vIZAHmr2fdbJBo9brhe
 UEvPO7CwurCJ3cLt7/RJ+LzzkWM3yripT3b45QGt+pq31uBJMjB9DTBj9QW1FS8fmUtzzn
 MZDmL7LTMsLxJDpHLHLplNbUnw+/Hws=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-HM6UA7RGOaeMUs8Y0-zHDg-1; Mon, 30 Dec 2024 19:23:58 -0500
X-MC-Unique: HM6UA7RGOaeMUs8Y0-zHDg-1
X-Mimecast-MFC-AGG-ID: HM6UA7RGOaeMUs8Y0-zHDg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862e986d17so4326839f8f.3
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604637; x=1736209437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uVl+dn480T+3VzLrS0d1h50fyBb5C28oZegz0tUkU0=;
 b=OgmZwggG5aZloEX99ZwX5DOx7Js2BQv0D/z2if3GZfxH6etsDUFHpN9iCcAUqiXuBQ
 jPWa6dSYdrSjLqnyx0PN6459JRwBK06b/Ma9thbRfHf40GNs14ti2Yh5omCgHN6/ir67
 9kGAwkaZ+ZWt6AZEe9kRCgb6wqNnh/TkLMcUCqgbfv1huzgRkt5r47C9jbSpxEjXijDG
 opQD6H62iKEGdk0fySPKKEBd0QNj7zUVsQYPxrBIJpmDrvAB/TuDAHjGz1J1kBqXHw+D
 WHwQHJ5bw2g4n5W14v3oY9K5MejEX0GSVmOfw0Dlu2UcS7xjArg+Zf3PkBecSmqTDn+W
 UZtQ==
X-Gm-Message-State: AOJu0YwY2mSFZ3FE+frdnlzaxhtjySlsXOkemzCEmCqRUW23EiEj1Dl5
 q2CyKiPEoPdEwyC6RrFnGzrdKW+AqqV00DZ2kcPUopcMdzA3LvAJLiE36J/nAbpQgQL3+5L0H7b
 AKbRgSH2CBeVNP8aRk2nZjdlYkiwvQbj8tjiM+V52R92zU2F0IHml9+fzbmCVOw==
X-Gm-Gg: ASbGncsi1sNGWG0a2OJ4q4RUbl1LkY7kkAYDDUzq3ohhrO8DynURCLdwJxvTapdJ+Ku
 ABju5wWLroNT00+qQhJz94MWrJ0dsA/RvnjoScqwgl7cLFx6BN0dCcp0Du1Uz8PJxW3gJbCf7BJ
 TPcNQWlSdvwY447y9AKfHx6yX8iLwXSZDMFh08qEFy1oC4K7QNKUd7uubwLCwDFBvEtSHecUbZW
 J5iBHtTopAkGBLCmalgxZ12Lsy/wUe6XfAXqjG8LDspt6Jb1/7yKYpJ2UY=
X-Received: by 2002:a05:6000:4a0a:b0:385:ef39:6ce9 with SMTP id
 ffacd0b85a97d-38a221f1716mr36518147f8f.21.1735604637052; 
 Mon, 30 Dec 2024 16:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvXzYyJWX8Fb3jJHzeylhs2LlThMR/Quu3QQyaP/zVm3en/VGZA1Gz5ARRS6Xt7WnVXVZZuA==
X-Received: by 2002:a05:6000:4a0a:b0:385:ef39:6ce9 with SMTP id
 ffacd0b85a97d-38a221f1716mr36518138f8f.21.1735604636667; 
 Mon, 30 Dec 2024 16:23:56 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219a08sm373893925e9.25.2024.12.30.16.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 7/9] rust: qemu_api: add vmstate_struct and vmstate_cell
Date: Tue, 31 Dec 2024 01:23:34 +0100
Message-ID: <20241231002336.25931-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q-IxqoPf-gqZVjyAJB5Vo1VK6n1sJwQzZlJV11ME0t4_1735604637
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:24:09 -0000

These are not type safe, but they're the best that can be done without
const_refs_static.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index b59a4b66339..e45c93587b2 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -610,6 +610,40 @@ macro_rules! vmstate_array_of_pointer_to_struct {
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
+    ($field_name:ident, $struct_name:ty, $vmsd:expr, $type:ty) => {{
+        $crate::bindings::VMStateField {
+            name: ::core::concat!(::core::stringify!($field_name), "\0")
+                .as_bytes()
+                .as_ptr() as *const ::std::os::raw::c_char,
+            offset: {
+                $crate::assert_field_type!($struct_name, $field_name, $type);
+                $crate::offset_of!($struct_name, $field_name)
+            }
+            size: ::core::mem::size_of::<$type>(),
+            flags: $crate::bindings::VMStateFlags::VMS_STRUCT,
+            vmsd: unsafe { $vmsd },
+            ..$crate::zeroable::Zeroable::ZERO
+        }
+    }};
+}
+
+#[macro_export]
+macro_rules! vmstate_cell {
+    ($field_name:ident, $struct_name:ty, $vmsd:expr, $type:ty) => {
+        $crate::vmstate_struct!($field_name, $struct_name, $vmsd, $type)
+    };
+}
+
 #[doc(alias = "VMSTATE_CLOCK_V")]
 #[macro_export]
 macro_rules! vmstate_clock_v {
-- 
2.47.1


