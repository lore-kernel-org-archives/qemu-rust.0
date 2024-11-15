Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOG-0007GB-Rh
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNd-0006TN-Kf
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNb-0002MZ-0u
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKxjJcV0JChOUSaR9ARk6UGjcpUxEbTMXigv0cQguQU=;
 b=htINxCRexA0e31uV5LBX1yzjlJhw7sj9GkDE0VHEuzn63MVl9UO+yp3MdFpEOEb3Q6m995
 4Qahg4KYqa+H658G6Mo0lJWd0GERKOQhnO1gX2dTdBzoz3qPeYZlZ+nWOaHhHu0GU4Ogpl
 oYlCmUv0zKgmen0WgBSmTCgaNMUphVs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-eXb8zsl_MWCfl889WQKsrQ-1; Fri, 15 Nov 2024 11:41:05 -0500
X-MC-Unique: eXb8zsl_MWCfl889WQKsrQ-1
X-Mimecast-MFC-AGG-ID: eXb8zsl_MWCfl889WQKsrQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d3e8dccc9so489376f8f.1
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688864; x=1732293664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKxjJcV0JChOUSaR9ARk6UGjcpUxEbTMXigv0cQguQU=;
 b=lcoenfWiSPiJDnPKD/Rr345kPWLDYm9psN0SVM4If7AaBfEL/jyf+V4xrsrVdnen5e
 XK187YegZZR0FLfkXNV9c0ZxmmvxbQWmH2aCod+nBpJSd63lzaa9O64UifY42mwOJ/OP
 ysQr56tkszIwS/Uw1nO7Il8lUID+6W77mQzzfqDX1i7SU6QwF3/wNSQHBJxQXp2ptJuZ
 wry/jJ++CVRlS6puPCWyRkXFcuE/IEhFUrup5NnFaiM92lk81UslWg47oxmhfaJC6+Il
 rRuUZDL+VCIYJjv9W60XZxj5B3rjP+5PhE97vVBIL9ZRqfUNi/ERpuAVTdCW36L90Nac
 6UJw==
X-Gm-Message-State: AOJu0Yz0o5G1/oO/t5x+Gqb8OjO9wksoXEwWbuvfsZXWFLD4cAbJqgyd
 u+SLF34v+RNIYghIAl5OMgKg0Mwl0hGKeeyCkBS93g1TA70gQrPzfA43CdySxnVrrxe6fM/AU9w
 V3wyurO/8u4zw/h5Dj+x6KE6inCh365opR9iaOhZDfaAJ2+DxEW0=
X-Received: by 2002:a05:6000:782:b0:37c:f3e0:b436 with SMTP id
 ffacd0b85a97d-38225a3999dmr2298714f8f.30.1731688863807; 
 Fri, 15 Nov 2024 08:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT2sxcga4Kr7D6NafnKd1hr4plVsuaoNEaJe4ZsnJtodjW2mk49DUZE6GhxKC1S4X4YgCufg==
X-Received: by 2002:a05:6000:782:b0:37c:f3e0:b436 with SMTP id
 ffacd0b85a97d-38225a3999dmr2298694f8f.30.1731688863459; 
 Fri, 15 Nov 2024 08:41:03 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada3e65sm4768683f8f.13.2024.11.15.08.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:41:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 09/12] rust: build: establish a baseline of lints across all
 crates
Date: Fri, 15 Nov 2024 17:40:22 +0100
Message-ID: <20241115164025.1917618-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lVPjIPImbUeFMRSMM7aXTV4veN7UhOXaPMOj_q5QvAU_1731688864
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.658,
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:12 -0000

Many lints that default to allow can be helpful in detecting bugs or
keeping the code style homogeneous.  Add them liberally, though perhaps
not as liberally as in hw/char/pl011/src/lib.rs.  In particular, enabling
entire groups can be problematic because of bitrot when new links are
added in the future.

For Clippy, this is actually a feature that is only present in Cargo
1.74.0 but, since we are not using Cargo to *build* QEMU, only developers
will need a new-enough cargo and only to run tools such as clippy.
The requirement does not apply to distros that are building QEMU.

Reviewed-by: Junjie Mao <junjie.mao@hotmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml               | 65 +++++++++++++++++++++++++++++++++++
 rust/hw/char/pl011/src/lib.rs | 19 ++--------
 rust/qemu-api/src/bindings.rs |  6 ++--
 3 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 358c517bc56..c3f7142d264 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -19,3 +19,68 @@ unknown_lints = "allow"
 
 # Prohibit code that is forbidden in Rust 2024
 unsafe_op_in_unsafe_fn = "deny"
+
+[workspace.lints.rustdoc]
+broken_intra_doc_links = "deny"
+invalid_html_tags = "deny"
+invalid_rust_codeblocks = "deny"
+bare_urls = "deny"
+unescaped_backticks = "deny"
+redundant_explicit_links = "deny"
+
+[workspace.lints.clippy]
+# default-warn lints
+result_unit_err = "allow"
+should_implement_trait = "deny"
+
+# default-allow lints
+as_underscore = "deny"
+assertions_on_result_states = "deny"
+bool_to_int_with_if = "deny"
+borrow_as_ptr = "deny"
+cast_lossless = "deny"
+dbg_macro = "deny"
+debug_assert_with_mut_call = "deny"
+derive_partial_eq_without_eq = "deny"
+doc_markdown = "deny"
+empty_structs_with_brackets = "deny"
+ignored_unit_patterns = "deny"
+implicit_clone = "deny"
+macro_use_imports = "deny"
+missing_const_for_fn = "deny"
+missing_safety_doc = "deny"
+multiple_crate_versions = "deny"
+mut_mut = "deny"
+needless_bitwise_bool = "deny"
+needless_pass_by_ref_mut = "deny"
+no_effect_underscore_binding = "deny"
+option_option = "deny"
+or_fun_call = "deny"
+ptr_as_ptr = "deny"
+pub_underscore_fields = "deny"
+redundant_clone = "deny"
+redundant_closure_for_method_calls = "deny"
+redundant_else = "deny"
+redundant_pub_crate = "deny"
+ref_binding_to_reference = "deny"
+ref_option_ref = "deny"
+return_self_not_must_use = "deny"
+same_name_method = "deny"
+semicolon_inside_block = "deny"
+shadow_unrelated = "deny"
+significant_drop_in_scrutinee = "deny"
+significant_drop_tightening = "deny"
+suspicious_operation_groupings = "deny"
+transmute_ptr_to_ptr = "deny"
+transmute_undefined_repr = "deny"
+type_repetition_in_bounds = "deny"
+unused_self = "deny"
+used_underscore_binding = "deny"
+
+# nice to have, but cannot be enabled yet
+#wildcard_imports = "deny"   # still have many bindings::* imports
+#ptr_cast_constness = "deny" # needs 1.65.0 for cast_mut()/cast_const()
+
+# these may have false positives
+#option_if_let_else = "deny"
+cognitive_complexity = "deny"
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index cd0a49acb91..4dc0e8f345f 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -14,28 +14,15 @@
 //! the [`registers`] module for register types.
 
 #![deny(
-    rustdoc::broken_intra_doc_links,
-    rustdoc::redundant_explicit_links,
     clippy::correctness,
     clippy::suspicious,
     clippy::complexity,
     clippy::perf,
     clippy::cargo,
     clippy::nursery,
-    clippy::style,
-    // restriction group
-    clippy::dbg_macro,
-    clippy::as_underscore,
-    clippy::assertions_on_result_states,
-    // pedantic group
-    clippy::doc_markdown,
-    clippy::borrow_as_ptr,
-    clippy::cast_lossless,
-    clippy::option_if_let_else,
-    clippy::missing_const_for_fn,
-    clippy::cognitive_complexity,
-    clippy::missing_safety_doc,
-    )]
+    clippy::style
+)]
+#![allow(clippy::upper_case_acronyms)]
 #![allow(clippy::result_unit_err)]
 
 extern crate bilge;
diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 0b76ec58bee..8a9b821bb91 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -7,10 +7,10 @@
     non_snake_case,
     non_upper_case_globals,
     unsafe_op_in_unsafe_fn,
+    clippy::pedantic,
+    clippy::restriction,
+    clippy::style,
     clippy::missing_const_for_fn,
-    clippy::too_many_arguments,
-    clippy::approx_constant,
-    clippy::use_self,
     clippy::useless_transmute,
     clippy::missing_safety_doc
 )]
-- 
2.47.0


