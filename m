Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrl0-0003ZL-MF
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkw-0003Xs-RN
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkt-0005ko-T0
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ya2k66L69MguUJ7e/92cimrey+KKi+WpqMAX7zuo+gA=;
 b=IwiBgE+Jbr3emFGH+/zBFuP3VffhpdvwcJDRn1PajRn2A99E2YTDV65pl2y2Mr80DMtHKh
 9CWS5T50XTYnOvnyIqAIw61PFltRWyaAfxPof1/3g9B/bNP4dWDcMSLVt7Nlyd2xMs5996
 NKBDQ1mA0kD8XUkzzi4xIp71gTAkTm8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-nGGYIcZOO1Ofs4eXND7zww-1; Mon, 05 May 2025 05:04:53 -0400
X-MC-Unique: nGGYIcZOO1Ofs4eXND7zww-1
X-Mimecast-MFC-AGG-ID: nGGYIcZOO1Ofs4eXND7zww_1746435892
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so16959305e9.1
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435892; x=1747040692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ya2k66L69MguUJ7e/92cimrey+KKi+WpqMAX7zuo+gA=;
 b=gxzh95WN2DwsnXks/5ZOSHamd/57yje3CamETrMaflgrC0GT3VVmEMUDYOPPrcFWNV
 Zu1BHK98sITpEDpp9buAzV6y5UrTAzd1U36r7Ye2KX+JlPaonnRSD1UjlkekBr/xxh3G
 rYjNm3dyo4XfwjXhSpKnSw5Iwhf2kb72RXiHByfxZJdSFinPx9fzLYy6Yp5S77/GCRY/
 yUYNEgVQynUjrz03KhinGHAvOeXTi0PoOtHzcthvlbC9EtYnx+m0ZVhytf9W66GRqfmM
 +BjjhfMrC60PrK5mv9TWuWlc2h9KzVukp7dOSkAuC+FFBxpsSCK35mRz+V7B29ZlSdfu
 jjiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6yKq4QKSWPyUhb+WMFrsPW1sbc5ElO8m5TxZN2oLWP+kZWtRwGCbxGppPMHh94kyWItKfB2PBhVA=@nongnu.org
X-Gm-Message-State: AOJu0Yx+oPqjvrYxYvr7O3pq2tEDy/8+3CRFX6Ozv2r1A6LGAJ0RU6pU
 71VtLe6ItO91SWK5qOmWu3jdM5KRdxT6r5eu3tEqEUOL1ABYfud3uL6uEgZ3LOuOU/LbW8iynVI
 GSNX1XguUa9fA/yRWwGWFAbpEr6l0l3zhgHjF/0j4Bg9R1H7YflWBAuE+OCc=
X-Gm-Gg: ASbGncusEQvxHJqeBQMEkHzATmO+NBSk61DY41lRR3eK7XX5IWl9/s0gNHCv549T+rf
 ht0gnZGVqJHYa6hUwcTFhGJVb+zvvRYPWwKadsaSxN87NeiBmnBEHQlOxIvWpveCKJ0SoECjMob
 ZqvTAgdeQ9zVi4OXNRmcMrsuv8Au0j+Rwor/oVcdj0gth8fTRsn1inWhNrxb7uZGrzVuV1bOBHS
 1uH2nXi8b5pM4F9w8sxnsjtGU/rgxcox7L+0m/SgInGDkkFj0fNFQl+OCAjFjO9+0LlaUYKGhWP
 TxWqWOMI6oBxKxg=
X-Received: by 2002:a05:600c:3acd:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-441bb88c9f1mr92244395e9.10.1746435891939; 
 Mon, 05 May 2025 02:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVe8c/SXPKpUkmPyijE1jDB1zNxdbJ/AaUB37n6Rffwj3hvKuLJVKKEiaOAleaEtbv4n76JQ==
X-Received: by 2002:a05:600c:3acd:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-441bb88c9f1mr92244075e9.10.1746435891520; 
 Mon, 05 May 2025 02:04:51 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89d150fsm125522215e9.15.2025.05.05.02.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 05/11] rust: qemu_api_macros: make pattern matching more
 readable and efficient
Date: Mon,  5 May 2025 11:04:30 +0200
Message-ID: <20250505090438.24992-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TvwDPynH7qWPH-OodVGp999s2xix0BYxyRcFVT6X0yI_1746435892
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 05 May 2025 09:04:59 -0000

"let ... else" is useful when visiting syntax trees; it avoids multiple
levels of indentation and places the error close to the pattern.

While at it, use "ref" to avoid moving the syntax tree objects.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api-macros/src/lib.rs | 84 +++++++++++++++------------------
 1 file changed, 37 insertions(+), 47 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index eda0d46d122..0bffd2691b4 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -16,50 +16,41 @@ fn get_fields<'a>(
     input: &'a DeriveInput,
     msg: &str,
 ) -> Result<&'a Punctuated<Field, Comma>, MacroError> {
-    if let Data::Struct(s) = &input.data {
-        if let Fields::Named(fs) = &s.fields {
-            Ok(&fs.named)
-        } else {
-            Err(MacroError::Message(
-                format!("Named fields required for {}", msg),
-                input.ident.span(),
-            ))
-        }
-    } else {
-        Err(MacroError::Message(
+    let Data::Struct(ref s) = &input.data else {
+        return Err(MacroError::Message(
             format!("Struct required for {}", msg),
             input.ident.span(),
-        ))
-    }
+        ));
+    };
+    let Fields::Named(ref fs) = &s.fields else {
+        return Err(MacroError::Message(
+            format!("Named fields required for {}", msg),
+            input.ident.span(),
+        ));
+    };
+    Ok(&fs.named)
 }
 
 fn get_unnamed_field<'a>(input: &'a DeriveInput, msg: &str) -> Result<&'a Field, MacroError> {
-    if let Data::Struct(s) = &input.data {
-        let unnamed = match &s.fields {
-            Fields::Unnamed(FieldsUnnamed {
-                unnamed: ref fields,
-                ..
-            }) => fields,
-            _ => {
-                return Err(MacroError::Message(
-                    format!("Tuple struct required for {}", msg),
-                    s.fields.span(),
-                ))
-            }
-        };
-        if unnamed.len() != 1 {
-            return Err(MacroError::Message(
-                format!("A single field is required for {}", msg),
-                s.fields.span(),
-            ));
-        }
-        Ok(&unnamed[0])
-    } else {
-        Err(MacroError::Message(
+    let Data::Struct(ref s) = &input.data else {
+        return Err(MacroError::Message(
             format!("Struct required for {}", msg),
             input.ident.span(),
-        ))
+        ));
+    };
+    let Fields::Unnamed(FieldsUnnamed { ref unnamed, .. }) = &s.fields else {
+        return Err(MacroError::Message(
+            format!("Tuple struct required for {}", msg),
+            s.fields.span(),
+        ));
+    };
+    if unnamed.len() != 1 {
+        return Err(MacroError::Message(
+            format!("A single field is required for {}", msg),
+            s.fields.span(),
+        ));
     }
+    Ok(&unnamed[0])
 }
 
 fn is_c_repr(input: &DeriveInput, msg: &str) -> Result<(), MacroError> {
@@ -210,20 +201,19 @@ fn get_repr_uN(input: &DeriveInput, msg: &str) -> Result<Path, MacroError> {
 }
 
 fn get_variants(input: &DeriveInput) -> Result<&Punctuated<Variant, Comma>, MacroError> {
-    if let Data::Enum(e) = &input.data {
-        if let Some(v) = e.variants.iter().find(|v| v.fields != Fields::Unit) {
-            return Err(MacroError::Message(
-                "Cannot derive TryInto for enum with non-unit variants.".to_string(),
-                v.fields.span(),
-            ));
-        }
-        Ok(&e.variants)
-    } else {
-        Err(MacroError::Message(
+    let Data::Enum(ref e) = &input.data else {
+        return Err(MacroError::Message(
             "Cannot derive TryInto for union or struct.".to_string(),
             input.ident.span(),
-        ))
+        ));
+    };
+    if let Some(v) = e.variants.iter().find(|v| v.fields != Fields::Unit) {
+        return Err(MacroError::Message(
+            "Cannot derive TryInto for enum with non-unit variants.".to_string(),
+            v.fields.span(),
+        ));
     }
+    Ok(&e.variants)
 }
 
 #[rustfmt::skip::macros(quote)]
-- 
2.49.0


