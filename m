Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYle-00031X-24
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlJ-0002tc-Fk
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlH-0007nA-AJ
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlCPu9vrL2ikpJGmpcQeDNOSLxpS9BRUCw1rNrAFygE=;
 b=QZ5Ql4wY6BVsCEuVATgts5CRP46fX+svUPBHW2UJAR7XLfiHwDBimX3PWtCna3jqroTdky
 oKRFQK2Asx3KoC4O1M4KT0Nw38v9n+ePYypw1gvgQEKYP+12XxYw7NIroOXybkIeIAOC+k
 yurDtFsY2ck5YYvzZmfFYiEMSYsyC0o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-6sfEcfMgOo6wcRNcYyow2Q-1; Mon, 26 May 2025 10:25:05 -0400
X-MC-Unique: 6sfEcfMgOo6wcRNcYyow2Q-1
X-Mimecast-MFC-AGG-ID: 6sfEcfMgOo6wcRNcYyow2Q_1748269504
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-445135eb689so15257315e9.2
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269504; x=1748874304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlCPu9vrL2ikpJGmpcQeDNOSLxpS9BRUCw1rNrAFygE=;
 b=YGzsbTlow4dBGpvZIPLInkFag+mbltcWTbQOofCHi3pEicJwSVj2w93+soHLqHpw8w
 XPiw1KKA1XN4c6Z0GrbJLCznWIvy73N/w1tUG7NoXuEBN6Rj89kCnizRoSWOYZoMagmU
 bT6oV07aYVtlIFbSVIb+hNuzcdv+9txL5ZR+WpGYjcVXSlgRY/g1fMw5XXJrAP9O5xL+
 SRJhMaCmLRFyTRxxI8QXbF+QLA3/1csCnEjngCz9olHBpWBSytgc9vbnG4dd9oJMcT34
 07TBGBlaYG92A8RPvFGqg3Q409KXr3ieh4hCg6tts7gXbvKNBTXofE2B/3jSHzjlH7Lc
 GEDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBS8AC/p+Ib1ozhM3gW9Y9h7MxoIctvuJqpcgQO0QWvhh60GETI4+UMLQsWP1vE2fOmKrCAjEHS10=@nongnu.org
X-Gm-Message-State: AOJu0YzCQpRJB9lGf/XMs7/E5RZPF+hZFKfQsjGzxI9TpmEtYOodKnnu
 8X+qaj1I+ePC929KMJhAPNaTgBHtuLNIibwHjj3UGpOYpQpXhpGrU0O7F+aHnIm2szxfhUxvOLS
 NPCnf/aW1Jvamy4gFJxmaBdhtoUi0RAGgo8AKR20VMGaeSpT5nrA8WGM=
X-Gm-Gg: ASbGncvK1ELsQ3oxrlFp6T43bBsboVR/unwpChmBBoBluEg0KmR0k9bB+yrL7+8gyUk
 tokhjnSyhgBzcZiqAxfX/9vsF/mLEYzNn+My9QXDgsPTQl47R4UBJjkVdG4QcbiNdOZQpYNYcNG
 e3FFeujFy0pk+dM3j21egCJAGk/INAE5jyOFKOcIQRK3FoXosbiF2fzrez9/vdSqd3megLrguFG
 0mN2EL+vW4jD0ojDX378Z7tnSXccS2RvPNM3O20bWHuoNsjjNBkiHUSLWw+Y8v1CBMGVuyhvkQx
 /hbXO+gbKdJeRw==
X-Received: by 2002:a05:600c:1388:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-44c916fc5efmr79230815e9.6.1748269503794; 
 Mon, 26 May 2025 07:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaP6wuLhtodH0ZREfjb81Kkt7FnQnrzkJlWD9VkcNaZufp6drsy9MAwkt5vJkaAXcevIcXYg==
X-Received: by 2002:a05:600c:1388:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-44c916fc5efmr79230565e9.6.1748269503357; 
 Mon, 26 May 2025 07:25:03 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23c080asm246606405e9.22.2025.05.26.07.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 03/12] subprojects: add the foreign crate
Date: Mon, 26 May 2025 16:24:46 +0200
Message-ID: <20250526142455.1061519-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9P4r6VrRDFMhujPu4ib2dNbayMRj2R_BYUGPBv5W_Zo_1748269504
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:10 -0000

This is a cleaned up and separated version of the patches at
https://lore.kernel.org/all/20240701145853.1394967-4-pbonzini@redhat.com/
https://lore.kernel.org/all/20240701145853.1394967-5-pbonzini@redhat.com/

Its first user will be the Error bindings; for example a QEMU Error ** can be
converted to a Rust Option using

     unsafe { Option::<Error>::from_foreign(c_error) }

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/.gitignore                        |  1 +
 subprojects/foreign-0.2-rs.wrap               |  7 +++++
 .../packagefiles/foreign-0.2-rs/meson.build   | 26 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 subprojects/foreign-0.2-rs.wrap
 create mode 100644 subprojects/packagefiles/foreign-0.2-rs/meson.build

diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index b9ae507b85a..7b38c4f6281 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -11,6 +11,7 @@
 /bilge-0.2.0
 /bilge-impl-0.2.0
 /either-1.12.0
+/foreign-0.2.0
 /itertools-0.11.0
 /libc-0.2.162
 /proc-macro-error-1.0.4
diff --git a/subprojects/foreign-0.2-rs.wrap b/subprojects/foreign-0.2-rs.wrap
new file mode 100644
index 00000000000..bf3cab9407a
--- /dev/null
+++ b/subprojects/foreign-0.2-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = foreign-0.2.0
+source_url = https://crates.io/api/v1/crates/foreign/0.2.0/download
+source_filename = foreign-0.2.0.tar.gz
+source_hash = 37dd09e47ea8fd592a333f59fc52b894a97fe966ae9c6b7ef21ae38de6043462
+#method = cargo
+patch_directory = foreign-0.2-rs
diff --git a/subprojects/packagefiles/foreign-0.2-rs/meson.build b/subprojects/packagefiles/foreign-0.2-rs/meson.build
new file mode 100644
index 00000000000..56b835d3ba9
--- /dev/null
+++ b/subprojects/packagefiles/foreign-0.2-rs/meson.build
@@ -0,0 +1,26 @@
+project('foreign-0.2-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '0.2.0',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+subproject('libc-0.2-rs', required: true)
+libc_rs = dependency('libc-0.2-rs')
+
+_foreign_rs = static_library(
+  'foreign',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  rust_args: [
+    '--cap-lints', 'allow',
+  ],
+  dependencies: [libc_rs],
+)
+
+foreign_dep = declare_dependency(
+  link_with: _foreign_rs,
+)
+
+meson.override_dependency('foreign-0.2-rs', foreign_dep)
-- 
2.49.0


