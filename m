Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E7D111A8
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwF-0007JS-Db; Thu, 27 Nov 2025 08:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvj-0005dN-VZ
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvg-00027x-Jb
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35cW+AZMPXzQdRbMH+IdIxqC+JST8jSEuSl2qWTOWks=;
 b=H8pgTpBxCej/xtEtKAMk/iF2hmCj7znJ9PZp5Co/SfO1ye4J9AcTV2xLHdYSngeYeiLxR8
 sUDJ2Itwn217io1cTH24ywmoKDMrxBq7wwrvvmDPoF+gjiXnSuafG7c6afyiONjJM/aaQN
 hdCKnPnwoYs3YRoRHWo6Nl8OXKTNvuI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-m98CStFnPoGGhLyK0DbYYQ-1; Thu, 27 Nov 2025 08:20:56 -0500
X-MC-Unique: m98CStFnPoGGhLyK0DbYYQ-1
X-Mimecast-MFC-AGG-ID: m98CStFnPoGGhLyK0DbYYQ_1764249655
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b767784598dso63606366b.3
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249655; x=1764854455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=35cW+AZMPXzQdRbMH+IdIxqC+JST8jSEuSl2qWTOWks=;
 b=A2Mi6T+SS95yFlch4By92Ig1LUCDptxgic0evadY94PFQMwrSZcoU9Nn5sLnwyFyKb
 leoX549xHd1BfM35fb098AwAC0/N+Pi/rZ5Ucayc24l5hJTNG0hNxXXnmOF8m98F3sgL
 zHJW57vC5TnNu4WrhGHDgWG41MjbZH+FVI7MgOYN1tWrXMQY1f5hsotu+Rlikj7Nj0Fa
 wyr4IXLNKIpmXn0dpZ8fj1j6+6EX2XP2OUgmreWHeYrrvhXVfrW7gLG0s9kd0oP8PFyE
 0R6QNI71+pmUIZmM6ME0cSN4rpp+KbZ4RPM+syN4j+VT45qulPVxvrg6uzFIkUaH5Uro
 S1xg==
X-Gm-Message-State: AOJu0YxBh2HEeTRI4r1S+k7EMWpzCAFNTVlBkxSSOyaVWC2IWAL4Frhh
 Zsxofba8vZdQn01KIamAWjdbGpK9rphAynWcq7Tdracwij7gBpssrNKJDJopQf3zvEWdmnfGWNo
 lJ71zBNvWSNcbqzYPy6ieOPn4SXcl+eVpfbU2dgwNqd/Nym16H/vQkjlU9yHEG7g=
X-Gm-Gg: ASbGnctXu3ZB7sSNYUfbZanNS0Tk4ZqpkNbuOgVbSixvr+bDRcAjqxm8XuCm6X28qIM
 6FipgIyn7HFkePAaJCfrA7dWSKRcLQsLiTh+LkBkBMDbw/WFMS97zDWdsQi43EzZ4G3TKyF/qjt
 /YQ1cnKfVfHpsRhSFu26r5ABxQG8nE5a8zRVU7GEySLUdd/J4L6+2uovlbjVxGhSPtNwwmG/wnt
 UxPL0e9lUirEOwqctJtSPqlsvaBS1aeh7YV9wxbrFOHhEmeCGaKPN/D/T4urrz4YLUDBNhkRN+E
 4bi7iHF9opu6W2oogdSqAS+FWr6oj50563VrlYRsl/MRJkGRgOXSBuoXAIMY96N5KwFKfn8D2Ty
 gaH8+4ln9a5SO4KwstRMQDFi7QT24mfU5ezJQo9ObVSq45+Hq57zBLDOinZSIXErQi3mrarWg2X
 O2JCt0Dinm/GAvvEE=
X-Received: by 2002:a17:907:2d11:b0:b73:853d:540e with SMTP id
 a640c23a62f3a-b767170c823mr2707245066b.30.1764249655027; 
 Thu, 27 Nov 2025 05:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLkSAX/ex76yeg+naPEWLopgu3EY8SdxOS3m/Q7KCanmYDR6Wnsq+TcIYxujg2u6gn2qQCRQ==
X-Received: by 2002:a17:907:2d11:b0:b73:853d:540e with SMTP id
 a640c23a62f3a-b767170c823mr2707242666b.30.1764249654592; 
 Thu, 27 Nov 2025 05:20:54 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162c5csm168898566b.6.2025.11.27.05.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 7/9] rust: move strict lints handling to meson.build
Date: Thu, 27 Nov 2025 14:20:34 +0100
Message-ID: <20251127132036.84384-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XZgjwvVEL49TvnKiLa9jxhrfobPac_VouniSgXIAuhs_1764249655
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Simplify rustc_args.py, and align its code with what Meson's own Cargo.toml
translator does in v1.10.

Bump unknown_lints to "forbid", so that it will certainly override Cargo.toml's
"allow" level.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                |  7 +++----
 scripts/rust/rustc_args.py | 20 ++------------------
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/meson.build b/meson.build
index 270181038bf..e6a11cefdb7 100644
--- a/meson.build
+++ b/meson.build
@@ -128,14 +128,13 @@ if have_rust
   rustc_args = [find_program('scripts/rust/rustc_args.py'),
     '--rustc-version', rustc.version(),
     '--workspace', meson.project_source_root() / 'rust']
-  if get_option('strict_rust_lints')
-    rustc_args += ['--strict-lints']
-  endif
-
   rustfmt = find_program('rustfmt', required: false)
 
   rustc_lint_args = run_command(rustc_args, '--lints',
      capture: true, check: true).stdout().strip().splitlines()
+  if get_option('strict_rust_lints')
+    rustc_lint_args += ['-Dwarnings', '-Funknown_lints']
+  endif
 
   # Apart from procedural macros, our Rust executables will often link
   # with C code, so include all the libraries that C code needs.  This
diff --git a/scripts/rust/rustc_args.py b/scripts/rust/rustc_args.py
index 63b0748e0d3..8fb77785350 100644
--- a/scripts/rust/rustc_args.py
+++ b/scripts/rust/rustc_args.py
@@ -35,8 +35,6 @@
 except ImportError:
     import tomli as tomllib
 
-STRICT_LINTS = {"unknown_lints", "warnings"}
-
 
 class CargoTOML:
     tomldata: Mapping[Any, Any]
@@ -82,7 +80,7 @@ class LintFlag:
     priority: int
 
 
-def generate_lint_flags(cargo_toml: CargoTOML, strict_lints: bool) -> Iterable[str]:
+def generate_lint_flags(cargo_toml: CargoTOML) -> Iterable[str]:
     """Converts Cargo.toml lints to rustc -A/-D/-F/-W flags."""
 
     toml_lints = cargo_toml.lints
@@ -104,13 +102,6 @@ def generate_lint_flags(cargo_toml: CargoTOML, strict_lints: bool) -> Iterable[s
             else:
                 raise Exception(f"invalid level {level} for {prefix}{lint}")
 
-            if not (strict_lints and lint in STRICT_LINTS):
-                lint_list.append(LintFlag(flags=[flag, prefix + lint], priority=priority))
-
-    if strict_lints:
-        for lint in STRICT_LINTS:
-            lint_list.append(LintFlag(flags=["-D", lint], priority=1000000))
-
     lint_list.sort(key=lambda x: x.priority)
     for lint in lint_list:
         yield from lint.flags
@@ -187,13 +178,6 @@ def main() -> None:
         required=False,
         default="1.0.0",
     )
-    parser.add_argument(
-        "--strict-lints",
-        action="store_true",
-        dest="strict_lints",
-        help="apply stricter checks (for nightly Rust)",
-        default=False,
-    )
     args = parser.parse_args()
     if args.verbose:
         logging.basicConfig(level=logging.DEBUG)
@@ -207,7 +191,7 @@ def main() -> None:
         cargo_toml = CargoTOML(args.cargo_toml, None)
 
     if args.lints:
-        for tok in generate_lint_flags(cargo_toml, args.strict_lints):
+        for tok in generate_lint_flags(cargo_toml):
             print(tok)
 
     if rustc_version >= (1, 80):
-- 
2.51.1


