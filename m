Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOE-00071o-Ib
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNT-0006Ig-Bp
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNR-0002LH-An
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbZfDGVI8qqVsTKqZdaFZ6xvk03TszV2nYSfM9yNsD8=;
 b=b14kTCmY1UVRzf/52hZGwGmSX8m5Y81Y6Zmm4a4JgPb3xys6xXphMdQ37X3mF+ccIrktH0
 iVlrLA7s+Tjijuuf/yiVJOmQ1fu39PTIcuFuTYoLxqeRWvRKSrXgIaHiJbwdixgjJcXQFv
 9mOKKcYymwTL1zoIi5cmdPYb99lqdQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-0xw_i09JPkiHF7JMoT8bxA-1; Fri, 15 Nov 2024 11:40:53 -0500
X-MC-Unique: 0xw_i09JPkiHF7JMoT8bxA-1
X-Mimecast-MFC-AGG-ID: 0xw_i09JPkiHF7JMoT8bxA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4314f023f55so13203385e9.2
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688852; x=1732293652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbZfDGVI8qqVsTKqZdaFZ6xvk03TszV2nYSfM9yNsD8=;
 b=TOjCo/NhZpZiTPFVAp3NqI1WRt2IKNsGRGIYQhquIkqJnFWlHzkaG98J7LNrP0zaSH
 FfKXgdtkH7bxMklbTZ5XmsoCu5TNapfLEd7XXJ3+KA5LNesVK7mNSoxtQb79JlmH7V0N
 gdXOPZq4LeTnbHm9usOQKxlMrpjZImFKjIw6wMfKqxAwyJ+Lu8k5Bd0vhcsjpo7SwVUx
 YzZQ/m6sQwOwYHtmtRnnYfq+ZdMpZhTeZQpOkVzgMxwRkDozISIamLvljuKXbXim4J7W
 xC+bJSW/42OSySc0u6YCiCVps/3/VIC5eGNhcZ3SZcwUF8EZbBYXvE/b5rlKO4ocmvqA
 g7jQ==
X-Gm-Message-State: AOJu0Ywvc2wgnRUTFKfRXu/xzVaDsW8qUgK+BBkKk0532cren+G48bOB
 JgBapuACeNoQCU8AuCsNhKmbR34dLL9jzSK/23WTIewvhMMF4hsZ+ULfb/UQwg0fmIdLVqbXSfl
 a/Rm8sUn+dcshRZhZyTy4wV+ilaLnRZSGqtrHBfm6xmUdCu6wBa4=
X-Received: by 2002:a05:600c:cc4:b0:431:40ca:ce6e with SMTP id
 5b1f17b1804b1-432df791da4mr29207035e9.31.1731688852230; 
 Fri, 15 Nov 2024 08:40:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPE235lKKtHkSitgD1Vq1+M6hakvsORC3AamjxpSikVwAiPuc+b+sSHNLkap53hOKc5FZPrQ==
X-Received: by 2002:a05:600c:cc4:b0:431:40ca:ce6e with SMTP id
 5b1f17b1804b1-432df791da4mr29206865e9.31.1731688851849; 
 Fri, 15 Nov 2024 08:40:51 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da29ffe9sm63379635e9.44.2024.11.15.08.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:40:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 06/12] rust: cargo: store desired warning levels in workspace
 Cargo.toml
Date: Fri, 15 Nov 2024 17:40:19 +0100
Message-ID: <20241115164025.1917618-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZROeLWz3F6NjLehTHNFdQGomzFiJ0gTMW3lVftkTTPs_1731688852
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:09 -0000

An extra benefit of workspaces is that they allow to place lint level
settings in a single Cargo.toml; the settings are then inherited by
packages in the workspace.

Correspondingly, teach rustc_args.py to get the unexpected_cfgs
configuration from the workspace Cargo.toml.

Note that it is still possible to allow or deny warnings per crate or
module, via the #![] attribute syntax.  The rust/qemu-api/src/bindings.rs
file is an example.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                     |  7 +++---
 rust/Cargo.toml                 |  8 +++++++
 rust/hw/char/pl011/Cargo.toml   |  3 +++
 rust/qemu-api-macros/Cargo.toml |  3 +++
 rust/qemu-api/Cargo.toml        |  5 ++---
 rust/qemu-api/meson.build       |  2 +-
 scripts/rust/rustc_args.py      | 38 +++++++++++++++++++++++++++------
 7 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 231fccf3928..21e2a332d6c 100644
--- a/meson.build
+++ b/meson.build
@@ -121,11 +121,12 @@ endif
 
 if have_rust
   rustc_args = [find_program('scripts/rust/rustc_args.py'),
-    '--rustc-version', rustc.version()]
+    '--rustc-version', rustc.version(),
+    '--workspace', meson.project_source_root() / 'rust']
   rustfmt = find_program('rustfmt', required: false)
 
-  # Prohibit code that is forbidden in Rust 2024
-  rustc_lint_args = ['-D', 'unsafe_op_in_unsafe_fn']
+  rustc_lint_args = run_command(rustc_args, '--lints',
+     capture: true, check: true).stdout().strip().splitlines()
 
   # Occasionally, we may need to silence warnings and clippy lints that
   # were only introduced in newer Rust compiler versions.  Do not croak
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 0c94d5037da..4bb52bf0bd5 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -5,3 +5,11 @@ members = [
     "qemu-api",
     "hw/char/pl011",
 ]
+
+[workspace.lints.rust]
+unexpected_cfgs = { level = "deny", check-cfg = [
+    'cfg(MESON)', 'cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)',
+    'cfg(has_offset_of)'] }
+
+# Prohibit code that is forbidden in Rust 2024
+unsafe_op_in_unsafe_fn = "deny"
diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index a373906b9fb..58f3e859f7e 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -21,3 +21,6 @@ bilge = { version = "0.2.0" }
 bilge-impl = { version = "0.2.0" }
 qemu_api = { path = "../../../qemu-api" }
 qemu_api_macros = { path = "../../../qemu-api-macros" }
+
+[lints]
+workspace = true
diff --git a/rust/qemu-api-macros/Cargo.toml b/rust/qemu-api-macros/Cargo.toml
index a8f7377106b..5a27b52ee6e 100644
--- a/rust/qemu-api-macros/Cargo.toml
+++ b/rust/qemu-api-macros/Cargo.toml
@@ -20,3 +20,6 @@ proc-macro = true
 proc-macro2 = "1"
 quote = "1"
 syn = { version = "2", features = ["extra-traits"] }
+
+[lints]
+workspace = true
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
index cc716d75d46..669f288d1cb 100644
--- a/rust/qemu-api/Cargo.toml
+++ b/rust/qemu-api/Cargo.toml
@@ -23,6 +23,5 @@ version_check = "~0.9"
 default = []
 allocator = []
 
-[lints.rust]
-unexpected_cfgs = { level = "warn", check-cfg = ['cfg(MESON)', 'cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)',
-                                                 'cfg(has_offset_of)'] }
+[lints]
+workspace = true
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 1ed79672cc9..d719c13f46d 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -1,5 +1,5 @@
 _qemu_api_cfg = run_command(rustc_args,
-  '--config-headers', config_host_h, '--features', '--lints', files('Cargo.toml'),
+  '--config-headers', config_host_h, '--features', files('Cargo.toml'),
   capture: true, check: true).stdout().strip().splitlines()
 
 # _qemu_api_cfg += ['--cfg', 'feature="allocator"']
diff --git a/scripts/rust/rustc_args.py b/scripts/rust/rustc_args.py
index 9b9778a1cac..9df131a02bd 100644
--- a/scripts/rust/rustc_args.py
+++ b/scripts/rust/rustc_args.py
@@ -38,11 +38,21 @@
 
 class CargoTOML:
     tomldata: Mapping[Any, Any]
+    workspace_data: Mapping[Any, Any]
     check_cfg: Set[str]
 
-    def __init__(self, path: str):
-        with open(path, 'rb') as f:
-            self.tomldata = tomllib.load(f)
+    def __init__(self, path: Optional[str], workspace: Optional[str]):
+        if path is not None:
+            with open(path, 'rb') as f:
+                self.tomldata = tomllib.load(f)
+        else:
+            self.tomldata = {"lints": {"workspace": True}}
+
+        if workspace is not None:
+            with open(workspace, 'rb') as f:
+                self.workspace_data = tomllib.load(f)
+            if "workspace" not in self.workspace_data:
+                self.workspace_data["workspace"] = {}
 
         self.check_cfg = set(self.find_check_cfg())
 
@@ -54,10 +64,12 @@ def find_check_cfg(self) -> Iterable[str]:
 
     @property
     def lints(self) -> Mapping[Any, Any]:
-        return self.get_table("lints")
+        return self.get_table("lints", True)
 
-    def get_table(self, key: str) -> Mapping[Any, Any]:
+    def get_table(self, key: str, can_be_workspace: bool = False) -> Mapping[Any, Any]:
         table = self.tomldata.get(key, {})
+        if can_be_workspace and table.get("workspace", False) is True:
+            table = self.workspace_data["workspace"].get(key, {})
 
         return table
 
@@ -136,6 +148,16 @@ def main() -> None:
         action="store",
         dest="cargo_toml",
         help="path to Cargo.toml file",
+        nargs='?',
+    )
+    parser.add_argument(
+        "--workspace",
+        metavar="DIR",
+        action="store",
+        dest="workspace",
+        help="path to root of the workspace",
+        required=False,
+        default=None,
     )
     parser.add_argument(
         "--features",
@@ -168,7 +190,11 @@ def main() -> None:
     logging.debug("args: %s", args)
 
     rustc_version = tuple((int(x) for x in args.rustc_version.split('.')[0:2]))
-    cargo_toml = CargoTOML(args.cargo_toml)
+    if args.workspace:
+        workspace_cargo_toml = Path(args.workspace, "Cargo.toml").resolve()
+        cargo_toml = CargoTOML(args.cargo_toml, str(workspace_cargo_toml))
+    else:
+        cargo_toml = CargoTOML(args.cargo_toml, None)
 
     if args.lints:
         for tok in generate_lint_flags(cargo_toml):
-- 
2.47.0


