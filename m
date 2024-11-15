Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOE-00073u-Pt
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNX-0006Ni-T3
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNV-0002Lt-Jn
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B477qYom1cMNghuMK5V25JfYZq7LHn73PEI0iXzCXHc=;
 b=CyHHUJcO6b+iwwzL2qDI1UNWlqaQPjTOrcdDQMRDpzydq5WJIr3jAh/LssuKpS9CgZH2iQ
 8doAk6xTreKRqEQaDC07vRp0P+1JeveO0akMlUC0dRlEPHVZ2WujC1dko1y7kAQ0RqEJ6X
 08w5r5yRpI5hnCmLgGIAjoQ8wVSTffw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-_ADghe4wNBGECKk6aixdXw-1; Fri, 15 Nov 2024 11:40:59 -0500
X-MC-Unique: _ADghe4wNBGECKk6aixdXw-1
X-Mimecast-MFC-AGG-ID: _ADghe4wNBGECKk6aixdXw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43159c07193so18302705e9.0
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688856; x=1732293656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B477qYom1cMNghuMK5V25JfYZq7LHn73PEI0iXzCXHc=;
 b=kSTwvP9iGvbkBxEiyhOz+o2iuWk7lDKV7ZmPHIaojFvzbWsjno6LPurct971KkcJEq
 wy6LMxve88so0LokJUE3A+OyGPlwLTMzSYdigGYgjyb9J51+Ws+1eRegWG1z4bdYW6jg
 OkVS2FUCphqOkPF6Mr1Xx3E+QZpjy5W9MmPUGO2hcdUIQc33vEZzMWTTuT4VqJoeT6so
 xjBZsSjrTanS+UaLBuc3hf4i4mkob8hQLVV8MIEpkiIfF7lGy6KErNHuFDNPG3Q0ivW9
 ieuz8x7kNBvg6fSf6HBVDaCQFO+akO/8Kl2YKzXHJdkrJTWFARHTOmyOxXDWwhrXH3cF
 ofRA==
X-Gm-Message-State: AOJu0YzPoRwyTe0bie4Q/F4yblVan+fQAYzC25IH2zmKwqLqVKwA6q7e
 pjrb6Bh+ynmom8cp/LGB88SaVK2NqdKkd+Xfc9pahv+1y+Wi/NWdiyJ5alHQ6TLUw4vZP17hfOv
 XhqCPF/Wv9QxWQG1zJ7lGjLq5URJvGHMHpx2mEXHaH6dQ11PxVT6UmhiVgbFaQA==
X-Received: by 2002:a05:6000:460b:b0:37c:c51b:8d9c with SMTP id
 ffacd0b85a97d-38225ab7a2fmr3242819f8f.38.1731688855977; 
 Fri, 15 Nov 2024 08:40:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzvBtQ5DyN+msSdT2CcFq/LvPuSGI/CnwTo6bEw3j60bIFWXzvJI0yuSRlQfaAQWN/8m8ycA==
X-Received: by 2002:a05:6000:460b:b0:37c:c51b:8d9c with SMTP id
 ffacd0b85a97d-38225ab7a2fmr3242799f8f.38.1731688855530; 
 Fri, 15 Nov 2024 08:40:55 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adadf8fsm4767251f8f.39.2024.11.15.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:40:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 07/12] rust: build: move strict lints handling to rustc_args.py
Date: Fri, 15 Nov 2024 17:40:20 +0100
Message-ID: <20241115164025.1917618-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khvnXDp-XaM5ojFmkYJtiYTgUKa8UTYOhvdLrnFHFFM_1731688858
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:09 -0000

Make Cargo use unknown_lints = "allow" as well.  This is more future
proof as we might add new lints to rust/Cargo.toml that are not supported
by older versions of rustc or clippy.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                | 12 ++++--------
 rust/Cargo.toml            |  6 ++++++
 scripts/rust/rustc_args.py | 19 ++++++++++++++++---
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 21e2a332d6c..a807e2a6354 100644
--- a/meson.build
+++ b/meson.build
@@ -123,19 +123,15 @@ if have_rust
   rustc_args = [find_program('scripts/rust/rustc_args.py'),
     '--rustc-version', rustc.version(),
     '--workspace', meson.project_source_root() / 'rust']
+  if get_option('strict_rust_lints')
+    rustc_args += ['--strict-lints']
+  endif
+
   rustfmt = find_program('rustfmt', required: false)
 
   rustc_lint_args = run_command(rustc_args, '--lints',
      capture: true, check: true).stdout().strip().splitlines()
 
-  # Occasionally, we may need to silence warnings and clippy lints that
-  # were only introduced in newer Rust compiler versions.  Do not croak
-  # in that case; a CI job with rust_strict_lints == true ensures that
-  # we do not have misspelled allow() attributes.
-  if not get_option('strict_rust_lints')
-    rustc_lint_args += ['-A', 'unknown_lints']
-  endif
-
   # Apart from procedural macros, our Rust executables will often link
   # with C code, so include all the libraries that C code needs.  This
   # is safe; https://github.com/rust-lang/rust/pull/54675 says that
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 4bb52bf0bd5..358c517bc56 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -11,5 +11,11 @@ unexpected_cfgs = { level = "deny", check-cfg = [
     'cfg(MESON)', 'cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)',
     'cfg(has_offset_of)'] }
 
+# Occasionally, we may need to silence warnings and clippy lints that
+# were only introduced in newer Rust compiler versions.  Do not croak
+# in that case; a CI job with rust_strict_lints == true disables this
+# and ensures that we do not have misspelled allow() attributes.
+unknown_lints = "allow"
+
 # Prohibit code that is forbidden in Rust 2024
 unsafe_op_in_unsafe_fn = "deny"
diff --git a/scripts/rust/rustc_args.py b/scripts/rust/rustc_args.py
index 9df131a02bd..5525b3886fa 100644
--- a/scripts/rust/rustc_args.py
+++ b/scripts/rust/rustc_args.py
@@ -35,6 +35,8 @@
 except ImportError:
     import tomli as tomllib
 
+STRICT_LINTS = {"unknown_lints", "warnings"}
+
 
 class CargoTOML:
     tomldata: Mapping[Any, Any]
@@ -80,7 +82,7 @@ class LintFlag:
     priority: int
 
 
-def generate_lint_flags(cargo_toml: CargoTOML) -> Iterable[str]:
+def generate_lint_flags(cargo_toml: CargoTOML, strict_lints: bool) -> Iterable[str]:
     """Converts Cargo.toml lints to rustc -A/-D/-F/-W flags."""
 
     toml_lints = cargo_toml.lints
@@ -105,9 +107,13 @@ def generate_lint_flags(cargo_toml: CargoTOML) -> Iterable[str]:
             # This may change if QEMU ever invokes clippy-driver or rustdoc by
             # hand.  For now, check the syntax but do not add non-rustc lints to
             # the command line.
-            if k == "rust":
+            if k == "rust" and not (strict_lints and lint in STRICT_LINTS):
                 lint_list.append(LintFlag(flags=[flag, prefix + lint], priority=priority))
 
+    if strict_lints:
+        for lint in STRICT_LINTS:
+            lint_list.append(LintFlag(flags=["-D", lint], priority=1000000))
+
     lint_list.sort(key=lambda x: x.priority)
     for lint in lint_list:
         yield from lint.flags
@@ -184,6 +190,13 @@ def main() -> None:
         required=False,
         default="1.0.0",
     )
+    parser.add_argument(
+        "--strict-lints",
+        action="store_true",
+        dest="strict_lints",
+        help="apply stricter checks (for nightly Rust)",
+        default=False,
+    )
     args = parser.parse_args()
     if args.verbose:
         logging.basicConfig(level=logging.DEBUG)
@@ -197,7 +210,7 @@ def main() -> None:
         cargo_toml = CargoTOML(args.cargo_toml, None)
 
     if args.lints:
-        for tok in generate_lint_flags(cargo_toml):
+        for tok in generate_lint_flags(cargo_toml, args.strict_lints):
             print(tok)
 
     if rustc_version >= (1, 80):
-- 
2.47.0


