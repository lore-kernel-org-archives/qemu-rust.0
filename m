Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAnYU-0001Ct-NI
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYT-0001CN-Ej
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYR-0000ge-CX
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746181418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KZidse3o3NrsJSDXRiipRvy3WbuaGi3BmMJMyV+q9w=;
 b=eae3EtKKogUsHBY4ATLwPXzWpe3uEFS1fAVpzTS2xHG+sw6jAF4FRp2wi18+6pGZP0T70H
 XMNLogXhg0YH6kwTVO951mQLLZaadlC0pxeda6ENd/xyXJqS0+86EruXneOVZq+ytKtn3q
 VEUfol1aRNbuulW6+cZnESRTSMRhlQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-MUMZXin1O92cz-gxECZxBQ-1; Fri, 02 May 2025 06:23:37 -0400
X-MC-Unique: MUMZXin1O92cz-gxECZxBQ-1
X-Mimecast-MFC-AGG-ID: MUMZXin1O92cz-gxECZxBQ_1746181416
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39126c3469fso495209f8f.3
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746181415; x=1746786215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KZidse3o3NrsJSDXRiipRvy3WbuaGi3BmMJMyV+q9w=;
 b=ErxXPdaYIUEgSt7XtL9aMdHOnEAKrcgUZ1ZGTTBC0LbitBjSgvPoRAoIkn5x7pLsgD
 8HDhzJeLkna3Y/wrGQv/NCRZ+iFtwraUvjYEOkxbJrhoTmnqFcZ0krzSEj4MwlgfR/N2
 C4vJWKRIqLzSLe9GaBu/kgvTIVr8URV0Qml2p7v8wpHzEqKiFu5xgqhc+5i/cKjNb7lt
 PYMkiVSAMxcIWIFBWk+Zqg6o5tcwM2HNjfYzkxkyV5dNrdHo8trD4JGjacWd8KAKe2ow
 kaTusCTjQv34NTUutzAlZyg4HZm2AlukZ3kyDubwckfwe4E0lpMP6Mo7Nc7qi0STpZgg
 ZsMQ==
X-Gm-Message-State: AOJu0YzMSdbfPg7yk4WX2CazGamvvYHkDsagpT0siyjmTcC4lmCreLwi
 GUckdZcL2emnHF5/3iaa7pEKydMxrHZQ52oMHhWatknqJYzDr0m3fgrJDA8G4y9L5CtYVyaiwgZ
 6fgXLCXSygH5vp4h5/Z3tf1fwNoYv3EJmitfpfTpTpNrLXG9ogbTv+gPk4Gk=
X-Gm-Gg: ASbGncvtIa9Hp+kLaLfZwVynNz6ivtpgJ9PVVpO71zpiw8f1Zs3Dl48xZ7NGg4vLYBv
 2WDdyeYdDDqLXGnKDqgtOXhhaXY1yb5bYfabMRfN0zEIU7VetADx5ShtZIkiUZEDLg3+0xcwPq5
 6DdJkF62ZbtvUIHVHoW4qvq32G56vgZTM0h+Gv2jp829N/BrhXD41KdOuh+TUUT/HV41ip+iw4B
 IhAjmqkGFhAOe8kgcSZka9Csurv3ydKhTqGQSzvtsEpFgzdbfMEylEchicczdlK+wy7Z2Cg4z3z
 v5XGDajrZLc9AtY=
X-Received: by 2002:a05:6000:2211:b0:3a0:7a7c:235f with SMTP id
 ffacd0b85a97d-3a099ae939fmr1656674f8f.40.1746181415675; 
 Fri, 02 May 2025 03:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe841JaWdd9NmftMm7CM9LbE/3Sv/SvrR89UJ8RlEG4+lI5yeovCaZ3Vo4sZo3Qc6gS9KeDA==
X-Received: by 2002:a05:6000:2211:b0:3a0:7a7c:235f with SMTP id
 ffacd0b85a97d-3a099ae939fmr1656652f8f.40.1746181415315; 
 Fri, 02 May 2025 03:23:35 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae82e4sm1769890f8f.58.2025.05.02.03.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:23:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/9] rust: qemu_api_macros: use "let ... else"
Date: Fri,  2 May 2025 12:23:17 +0200
Message-ID: <20250502102323.104815-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502102323.104815-1-pbonzini@redhat.com>
References: <20250502102323.104815-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I6wHWKsx8xRF8rjV1zl3CiLoEBH_IEhb_Xsuur9LCbk_1746181416
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 10:23:41 -0000

"let ... else" is useful when visiting syntax trees, to avoid multiple
levels of indentation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api-macros/src/lib.rs | 84 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 44 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index eda0d46d122..1448f3025a4 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -16,50 +16,47 @@ fn get_fields<'a>(
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
+    let Data::Struct(s) = &input.data else {
+        return Err(MacroError::Message(
             format!("Struct required for {}", msg),
             input.ident.span(),
         ))
-    }
+    };
+    let Fields::Named(fs) = &s.fields else {
+        return Err(MacroError::Message(
+            format!("Named fields required for {}", msg),
+            input.ident.span(),
+        ))
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
+    let Data::Struct(s) = &input.data else {
+        return Err(MacroError::Message(
             format!("Struct required for {}", msg),
             input.ident.span(),
         ))
+    };
+    let unnamed = match &s.fields {
+        Fields::Unnamed(FieldsUnnamed {
+            unnamed: ref fields,
+            ..
+        }) => fields,
+        _ => {
+            return Err(MacroError::Message(
+                format!("Tuple struct required for {}", msg),
+                s.fields.span(),
+            ))
+        }
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
@@ -210,20 +207,19 @@ fn get_repr_uN(input: &DeriveInput, msg: &str) -> Result<Path, MacroError> {
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
+    let Data::Enum(e) = &input.data else {
+        return Err(MacroError::Message(
             "Cannot derive TryInto for union or struct.".to_string(),
             input.ident.span(),
         ))
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


