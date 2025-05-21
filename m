Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHefS-0004q4-QL
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 04:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefK-0004nT-HN
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefD-0000Aq-G0
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747815538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sm4FDV9XcvaUoJSoDVM8BTJfAISob2kgbvzU5BLD5+0=;
 b=ZKizF9JAYI5NR+87sYB3F9x6sparKI34baePqRJ+7lwzP12n7ZFplmiqwqQE3YnirH/FAa
 8/2Moqy8patVCKA5oXocJ+FG87TFYp3UPcTI9yJheAWD53A3eVzow8h73YtjjuxuvYm1Sd
 Olq8rMLJyyXC0OgnwPj0hiskJ5mr13c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-s7-vz18gNJCLK0OlKsfD_Q-1; Wed, 21 May 2025 04:18:56 -0400
X-MC-Unique: s7-vz18gNJCLK0OlKsfD_Q-1
X-Mimecast-MFC-AGG-ID: s7-vz18gNJCLK0OlKsfD_Q_1747815535
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso33186265e9.0
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 01:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815535; x=1748420335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sm4FDV9XcvaUoJSoDVM8BTJfAISob2kgbvzU5BLD5+0=;
 b=RSgyypUrr53+Zqc7+BpqiFabO/1WGazOObnzsdNothaNAA8mnCbi7V2w9va5018lTO
 JDt2vRJuh2G8rmm63OHTfkLfYnd+GC2ZCoSrENE2NNpCDc4LJAdDUx5W6VaDNtpeYJOf
 +4fdImS6gFwlv6VJ9bs3ikr6NzFNZLC16DStJZpHpzZUWTdbLbW0OdVgPgCYf45zCs2K
 e18neRsNkLq04A08Y+5+4XZeAvt60yos9RjHEpqOKgsP+y3x6Y2R67jcnJd09bsSyNCx
 TxycjIO31kYMMSIdDk4DD1FkzeeYImFYjWqOCP8WXEF4K1/zmL+7BGuIfzBi9aOcOk1r
 oUXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa/rY/6qLugD1uI3F5qWIFu4vfObrA4+0rwGoWXXgazRCaE1ohI7BxNLpZ3wvBL160AsvzcgN34Uk=@nongnu.org
X-Gm-Message-State: AOJu0YyJSaERn44IW4pTVDWRNWVn5pwnG0mFfhEDzXaDVu2se0X02VWX
 Bt6ZREax2b/dZxbBwWuDowieTx1D7gMOlzMMtaBFILw4aQ8J1deZTBT4wXUcH/6oyUZQDl0OvT/
 2eMDcJdm5QqZtQurE+ahK/Dv/iaRFO6v4CH4iYAxeioAsg429u9bDM+U=
X-Gm-Gg: ASbGncvNKbfovb4bh9yF8xqd38qDBgy8Ya3iE2r3jYpY4c/Mp5aFBAa+u0K5bo2xepy
 7d6dSZWJcUYGaI8C13ZKYGSIKIdGkl7vIGYm2slUUQQ3mQqBsiZpB5mSHaW9NiToDgr2gHJbOFp
 rdz8NFu8pJ7a9g89YZ/Fgp85g/QowfOScKMjwLSa4G9SVvPsgSHAa29B6BFGMRd0TnbACnliTUY
 08flmprOlLdKtHoUoojigcwXrDj6HgCst/KTPa+X2mfHFzypeMImQ77bTQIMv4ifybSfdS+etm7
 NU572MSGJ0JaDA==
X-Received: by 2002:a05:600c:3e8d:b0:43d:174:2668 with SMTP id
 5b1f17b1804b1-442f844e5d4mr208403995e9.0.1747815535269; 
 Wed, 21 May 2025 01:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcK8YTwPUKcO65rs2si2DQU9nhEw3TQ5CTI6CUM2IeHnAm8wcOmtgnkQnf+sn8QKK4TIOxHw==
X-Received: by 2002:a05:600c:3e8d:b0:43d:174:2668 with SMTP id
 5b1f17b1804b1-442f844e5d4mr208403745e9.0.1747815534893; 
 Wed, 21 May 2025 01:18:54 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a87fsm18560962f8f.29.2025.05.21.01.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 01:18:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-rust@nongnu.org,
 manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 3/6] rust: qemu-api-macros: add from_bits and into_bits to
 #[derive(TryInto)]
Date: Wed, 21 May 2025 10:18:42 +0200
Message-ID: <20250521081845.496442-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521081845.496442-1-pbonzini@redhat.com>
References: <20250521081845.496442-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xseTCS4F7WPoXqQBMcW_52TsoLtz1OZYEIGQdbCY2dA_1747815535
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 21 May 2025 08:19:06 -0000

These const functions make it possible to use enums easily together
with the bitfield-struct crate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api-macros/src/lib.rs | 48 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index ceb79f09f97..103470785e3 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -193,23 +193,51 @@ fn get_variants(input: &DeriveInput) -> Result<&Punctuated<Variant, Comma>, Macr
 }
 
 #[rustfmt::skip::macros(quote)]
-fn derive_tryinto_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream, MacroError> {
-    let repr = get_repr_uN(&input, "#[derive(TryInto)]")?;
-
-    let name = &input.ident;
-    let variants = get_variants(&input)?;
+fn derive_tryinto_body(
+    name: &Ident,
+    variants: &Punctuated<Variant, Comma>,
+    repr: &Path,
+) -> Result<proc_macro2::TokenStream, MacroError> {
     let discriminants: Vec<&Ident> = variants.iter().map(|f| &f.ident).collect();
 
     Ok(quote! {
+        #(const #discriminants: #repr = #name::#discriminants as #repr;)*;
+        match value {
+            #(#discriminants => Ok(#name::#discriminants),)*
+            _ => Err(value),
+        }
+    })
+}
+
+#[rustfmt::skip::macros(quote)]
+fn derive_tryinto_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream, MacroError> {
+    let repr = get_repr_uN(&input, "#[derive(TryInto)]")?;
+    let name = &input.ident;
+    let body = derive_tryinto_body(name, get_variants(&input)?, &repr)?;
+    let errmsg = format!("invalid value for {name}");
+
+    Ok(quote! {
+        impl #name {
+            #[allow(dead_code)]
+            pub const fn into_bits(self) -> #repr {
+                self as #repr
+            }
+
+            #[allow(dead_code)]
+            pub const fn from_bits(value: #repr) -> Self {
+                match ({
+                    #body
+                }) {
+                    Ok(x) => x,
+                    Err(_) => panic!(#errmsg)
+                }
+            }
+        }
         impl core::convert::TryFrom<#repr> for #name {
             type Error = #repr;
 
             fn try_from(value: #repr) -> Result<Self, Self::Error> {
-                #(const #discriminants: #repr = #name::#discriminants as #repr;)*;
-                match value {
-                    #(#discriminants => Ok(Self::#discriminants),)*
-                    _ => Err(value),
-                }
+                #body
             }
         }
     })
-- 
2.49.0


