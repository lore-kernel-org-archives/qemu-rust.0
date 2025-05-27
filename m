Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxiz-0005hU-DV
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxiw-0005fY-5j
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxio-0006g6-2f
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whk0bx3S6iDRVW9awl3GtYiXbZ6tm1mvhJAdBgRVaBk=;
 b=eI7ZaIR9R4TkG1H7FQbaTZdtZmIq0/KDmefkD9CxBeWgboNfcqhky25M/RjrmUPpOPecO7
 kT5Qy8sldsdAqYbbXYjbMwIzbnNVFFfq7DzZzaG9j3iZcg54gXcOj+bzG91nKvHBduhWsv
 62KnT3gAvnFnNG77Zg8B+7NAFEaK0Sk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-QyajThLGN-usKMBzOQ_53Q-1; Tue, 27 May 2025 13:04:11 -0400
X-MC-Unique: QyajThLGN-usKMBzOQ_53Q-1
X-Mimecast-MFC-AGG-ID: QyajThLGN-usKMBzOQ_53Q_1748365450
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-acf00f500d2so255629366b.2
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365450; x=1748970250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whk0bx3S6iDRVW9awl3GtYiXbZ6tm1mvhJAdBgRVaBk=;
 b=v15aHoHmUj12Lyx1+3Qa2jZ5bImDRs7KEoLXhIMlQAGIcgjvmiEHsRs993JK3Abd/I
 CShXV/Eo2/83ZKbA3hBaDM5RqgcILS3eTEqzwttEzhKritZad5Cpf5eDRQ5ncdkvHaP5
 iQn7bXnUmmQnSsdXzijjYvcXRXjtj0TAFhb8g1mp+2OWLDmEXE+3PPeFcgPpRwf8AdDg
 xNCpfX9C7cLdIzo8d7RfpYtC/uZJFU04Ued2VI+LuR0+wV2Tzk0JFxSMVZieZ6UO3zwy
 6XKJrUaLUPVGeO08R6lkebvBsAvt0+RoH2AoXYUROqwFDMyZsyL/+D0/BtZz0lWMnqgt
 mXHw==
X-Gm-Message-State: AOJu0YwDi++xuIr2bS/a+srlAIY+HrIHYyd1aWnTPwLJqIQr03euwsUx
 6R7V0JSSJaAUZwv/oW9tcq6UPfmKOuSKSCxd//VVLIAk9sEOya8b7AiBMDlWeipUOCryLzMY4mB
 tSj2IVYebWmQAZr+pYaH4+DovQuNClrlrOUED6QkjV02Mj+DwoZuy1lo=
X-Gm-Gg: ASbGncu0ruxXUO/eTeqFSAN1c9LpOMIXXOlGvIKGdMpB0sCkjIbLR6F6KmrsmrN6jee
 gMXxGfkUfr6VpNARBfPdAPAHIJXMO9ITGf9gbt9FkTuKbRcUW4isGp+vfoOsT3ZT0hr1CuoYEmX
 RnSSw3omZVKaxBux8e7JAF9nhNx6C2MrxgA8UQQBdFZeXLmhQ+9xLvn3fxoBv5bQuqJFKEeamyG
 A7G0lZRF2/hIZL0yIeqtdBzpESMldCGGzvbEV/33Xy2+hDVem7cgbMd0VaZ72/O/iS9DKqH6Mjg
 BieBEd+8jSB48w==
X-Received: by 2002:a17:907:2cc4:b0:ad8:55d8:38bc with SMTP id
 a640c23a62f3a-ad85b1de6cbmr1289909366b.43.1748365450054; 
 Tue, 27 May 2025 10:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsNB5QXYe1gwRsd/Ukk5FK+oKo9Mz5rtW28Ni4fmUZWVVgGswW1pT3vFqZmUOqTGH6DTbXcg==
X-Received: by 2002:a17:907:2cc4:b0:ad8:55d8:38bc with SMTP id
 a640c23a62f3a-ad85b1de6cbmr1289903366b.43.1748365449548; 
 Tue, 27 May 2025 10:04:09 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4c9e62sm1867452766b.155.2025.05.27.10.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/6] rust: use "objects" for Rust executables as well
Date: Tue, 27 May 2025 19:04:00 +0200
Message-ID: <20250527170404.1580482-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527170404.1580482-1-pbonzini@redhat.com>
References: <20250527170404.1580482-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ELlbF7QiOV7sbD9oLxs3CiI0ZhStMOKxk5Ez82P30Hw_1748365450
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 27 May 2025 17:04:22 -0000

libqemuutil is not meant be linked as a whole; if modules are enabled, doing
so results in undefined symbols (corresponding to QMP commands) in
rust/qemu-api/rust-qemu-api-integration.

Support for "objects" in Rust executables is available in Meson 1.8.0; use it
to switching to the same dependencies that C targets use: link_with for
libqemuutil, and objects for everything else.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst       |  2 --
 rust/meson.build          |  2 ++
 rust/qemu-api/meson.build | 24 +++---------------------
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 171d908e0b0..11328c05b45 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -66,8 +66,6 @@ be run via ``meson test`` or ``make``::
 
    make check-rust
 
-Building Rust code with ``--enable-modules`` is not supported yet.
-
 Supported tools
 '''''''''''''''
 
diff --git a/rust/meson.build b/rust/meson.build
index 1f0dcce7d04..801f4374dfa 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -14,6 +14,8 @@ quote_rs_native = dependency('quote-1-rs', native: true)
 syn_rs_native = dependency('syn-2-rs', native: true)
 proc_macro2_rs_native = dependency('proc-macro2-1-rs', native: true)
 
+qemuutil_rs = qemuutil.partial_dependency(link_args: true, links: true)
+
 subdir('qemu-api-macros')
 subdir('qemu-api')
 
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 1ea86b8bbf1..c647493f712 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -41,26 +41,8 @@ _qemu_api_rs = static_library(
 rust.test('rust-qemu-api-tests', _qemu_api_rs,
           suite: ['unit', 'rust'])
 
-qemu_api = declare_dependency(link_with: _qemu_api_rs)
-
-# Rust executables do not support objects, so add an intermediate step.
-rust_qemu_api_objs = static_library(
-    'rust_qemu_api_objs',
-    objects: [libqom.extract_all_objects(recursive: false),
-              libhwcore.extract_all_objects(recursive: false),
-              libchardev.extract_all_objects(recursive: false),
-              libcrypto.extract_all_objects(recursive: false),
-              libauthz.extract_all_objects(recursive: false),
-              libio.extract_all_objects(recursive: false),
-              libmigration.extract_all_objects(recursive: false)])
-rust_qemu_api_deps = declare_dependency(
-    dependencies: [
-      qom_ss.dependencies(),
-      chardev_ss.dependencies(),
-      crypto_ss.dependencies(),
-      authz_ss.dependencies(),
-      io_ss.dependencies()],
-    link_whole: [rust_qemu_api_objs, libqemuutil])
+qemu_api = declare_dependency(link_with: [_qemu_api_rs],
+  dependencies: [qemuutil_rs, qemu_api_macros, qom, hwcore, chardev, migration])
 
 test('rust-qemu-api-integration',
     executable(
@@ -69,7 +51,7 @@ test('rust-qemu-api-integration',
         override_options: ['rust_std=2021', 'build.rust_std=2021'],
         rust_args: ['--test'],
         install: false,
-        dependencies: [qemu_api, qemu_api_macros, rust_qemu_api_deps]),
+        dependencies: qemu_api),
     args: [
         '--test', '--test-threads', '1',
         '--format', 'pretty',
-- 
2.49.0


