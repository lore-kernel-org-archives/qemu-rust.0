Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uQ448-0000Ru-S0
	for mharc-qemu-rust@gnu.org; Fri, 13 Jun 2025 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43i-00009d-DF
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43f-0000Yl-VW
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749819779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZA6ipBLWLrIC7AEh0eM3XoAiZ5TU/mlZesNKTaKlNBk=;
 b=P/xzoz7QGV9Mt8XoB1Czm7ndNCXL3/jkmwqYiLt8mwOt3gRsbBZKDG8/B00IhIVmxg0MmO
 VDNvI/wlLSseYrAvMLHbYsSGXmTMdEwoQUh7TKeTzxMG8ZD+0C6UP5ieMl2ab5y59d36aG
 USZp+BXKhVjH64BQjd+Fu1x/drTOKIo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-l0AwSkx-OcqsIbLeJya4Xw-1; Fri, 13 Jun 2025 09:02:57 -0400
X-MC-Unique: l0AwSkx-OcqsIbLeJya4Xw-1
X-Mimecast-MFC-AGG-ID: l0AwSkx-OcqsIbLeJya4Xw_1749819776
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-553218c5adaso1042892e87.2
 for <qemu-rust@nongnu.org>; Fri, 13 Jun 2025 06:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749819776; x=1750424576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZA6ipBLWLrIC7AEh0eM3XoAiZ5TU/mlZesNKTaKlNBk=;
 b=jNWwV4V9ShbYYR4TDlIYD4Gf7wbCJDh+Taii43lcFQMaUtia8AQQyw/1k4sPqPt/fn
 epQsNnY9X6MBvpAqyYLBjFGo76fPpoAUJeIuWwwcCdDM1UScisogE8LqIJ+PBqFIZuRQ
 xGbg2w5TLsrjYpkL8G8DglIODGO9TQ25Yow299Q/lm/cAGGSyk0BVhmDyfE6XqIqJfn1
 ZhbEKMo6tO6gpaE8+iA1W7goshmNHrGHLL9ILhOok+lWuItut13lzbflgTYY/m6IHxIB
 AzFvzA43D0m8p++Kgof9Yd2X/Z4ROQd76EVhXdxV3p4AUv7nqPXBGxsUEZ12LhUyIumH
 Ztmw==
X-Gm-Message-State: AOJu0YxPvpciVSQQirnpabnZgTDM3cbAZ9p2G8+t0JZ+ikG7NDzg2dmU
 Lu8LmfE9nt9wKmo1ssZBxyumIK+rKKfna4ACrdK0+cthAI+eC6ZVhtbEnxqyqf4tCOvqwqTW624
 rW7+CNphudtnPgzKBL3q6S1IqKULnBeclM+tBw448zqmLi8hka36qJgo=
X-Gm-Gg: ASbGnctm4zRhiQB2rTo5NENMGsMSZvfOiWyVuaI11az2QGoao6rVoRr39GwLOycS1Hx
 +GrIgu80ergpW8+9eBfOokwKcu0Eoi7cvnj+hNiF9fbARtdnHoJIiQwV0N4cD3VrncltyLfZ7VS
 WJ40Ci5H45Zc3psFPSrhuHym5SOR4NxK/lhs6xUtGEUesClR+pUGxOxFWaIKyArhOH5xlBt/jXv
 WT+C8hAJCvdY3ryBpoZ25jquiMprEPHBeURoCOdvSIRQuwm7gcWx83v7Ty+MfAt9EOR+xHkB28Z
 IHh3C/eAQfJptTYD0b0AAsfF
X-Received: by 2002:a05:6512:3b9e:b0:54f:c10b:7290 with SMTP id
 2adb3069b0e04-553af990816mr679589e87.26.1749819775666; 
 Fri, 13 Jun 2025 06:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpxJCiCgPC3g4pQu6RDNC9AT9wGHHLwPvV6P5CoOXSlnAU3g8YNDPvSc6gcFc/570e3/30jg==
X-Received: by 2002:a05:6512:3b9e:b0:54f:c10b:7290 with SMTP id
 2adb3069b0e04-553af990816mr679467e87.26.1749819774315; 
 Fri, 13 Jun 2025 06:02:54 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e25e89fsm50539045e9.33.2025.06.13.06.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:02:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	tanishdesai37@gmail.com
Subject: [PATCH 2/2] rust: move rust.bindgen to qemu-api crate
Date: Fri, 13 Jun 2025 15:02:49 +0200
Message-ID: <20250613130249.1225545-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613130249.1225545-1-pbonzini@redhat.com>
References: <20250613130249.1225545-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yByRWD6nco2Kxbi7mtHykRvxaQalxYKV5XKFv4_EaOU_1749819776
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Fri, 13 Jun 2025 13:03:03 -0000

Once qemu-api is split in multiple crates, each of which will have
its own invocation of bindgen.  There cannot be only one, because
there are occasional "impl" blocks for the bindgen-generated
structs (e.g. VMStateFlags or QOM classes) that have to
reside in the same crate as the bindgen-generated code.

For now, prepare for this new organization by invoking bindgen
within the qemu-api crate's build definitions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                   | 41 -----------------------------------
 rust/{ => qemu-api}/wrapper.h |  0
 rust/meson.build              |  4 +++-
 rust/qemu-api/meson.build     | 41 +++++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 42 deletions(-)
 rename rust/{ => qemu-api}/wrapper.h (100%)

diff --git a/meson.build b/meson.build
index d9838319dae..4676908dbb2 100644
--- a/meson.build
+++ b/meson.build
@@ -4234,47 +4234,6 @@ if have_rust
   else
     bindgen_args_common += ['--merge-extern-blocks']
   endif
-
-  bindgen_args = []
-  c_enums = [
-    'DeviceCategory',
-    'GpioPolarity',
-    'MachineInitPhase',
-    'MemoryDeviceInfoKind',
-    'MigrationPolicy',
-    'MigrationPriority',
-    'QEMUChrEvent',
-    'QEMUClockType',
-    'ResetType',
-    'device_endian',
-    'module_init_type',
-  ]
-  foreach enum : c_enums
-    bindgen_args += ['--rustified-enum', enum]
-  endforeach
-  c_bitfields = [
-    'ClockEvent',
-    'VMStateFlags',
-  ]
-  foreach enum : c_bitfields
-    bindgen_args += ['--bitfield-enum', enum]
-  endforeach
-
-  # TODO: Remove this comment when the clang/libclang mismatch issue is solved.
-  #
-  # Rust bindings generation with `bindgen` might fail in some cases where the
-  # detected `libclang` does not match the expected `clang` version/target. In
-  # this case you must pass the path to `clang` and `libclang` to your build
-  # command invocation using the environment variables CLANG_PATH and
-  # LIBCLANG_PATH
-  _qemu_api_bindings_inc_rs = rust.bindgen(
-    input: 'rust/wrapper.h',
-    dependencies: common_ss.all_dependencies(),
-    output: 'bindings.inc.rs',
-    include_directories: bindings_incdir,
-    bindgen_version: ['>=0.60.0'],
-    args: bindgen_args_common + bindgen_args,
-    )
   subdir('rust')
 endif
 
diff --git a/rust/wrapper.h b/rust/qemu-api/wrapper.h
similarity index 100%
rename from rust/wrapper.h
rename to rust/qemu-api/wrapper.h
diff --git a/rust/meson.build b/rust/meson.build
index e9f0879e296..331f11b7e72 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -20,6 +20,8 @@ proc_macro2_rs_native = dependency('proc-macro2-1-rs', native: true)
 
 qemuutil_rs = qemuutil.partial_dependency(link_args: true, links: true)
 
+genrs = []
+
 subdir('qemu-api-macros')
 subdir('bits')
 subdir('qemu-api')
@@ -33,5 +35,5 @@ if cargo.found()
     command: [config_host['MESON'], 'devenv',
               '--workdir', '@CURRENT_SOURCE_DIR@',
               cargo, 'fmt'],
-    depends: _qemu_api_bindings_inc_rs)
+    depends: genrs)
 endif
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 64c04dfd74b..05d010e094f 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -7,6 +7,47 @@ if get_option('debug_mutex')
   _qemu_api_cfg += ['--cfg', 'feature="debug_cell"']
 endif
 
+c_enums = [
+  'DeviceCategory',
+  'GpioPolarity',
+  'MachineInitPhase',
+  'MemoryDeviceInfoKind',
+  'MigrationPolicy',
+  'MigrationPriority',
+  'QEMUChrEvent',
+  'QEMUClockType',
+  'ResetType',
+  'device_endian',
+  'module_init_type',
+]
+_qemu_api_bindgen_args = []
+foreach enum : c_enums
+  _qemu_api_bindgen_args += ['--rustified-enum', enum]
+endforeach
+c_bitfields = [
+  'ClockEvent',
+  'VMStateFlags',
+]
+foreach enum : c_bitfields
+  _qemu_api_bindgen_args += ['--bitfield-enum', enum]
+endforeach
+
+# TODO: Remove this comment when the clang/libclang mismatch issue is solved.
+#
+# Rust bindings generation with `bindgen` might fail in some cases where the
+# detected `libclang` does not match the expected `clang` version/target. In
+# this case you must pass the path to `clang` and `libclang` to your build
+# command invocation using the environment variables CLANG_PATH and
+# LIBCLANG_PATH
+_qemu_api_bindings_inc_rs = rust.bindgen(
+  input: 'wrapper.h',
+  dependencies: common_ss.all_dependencies(),
+  output: 'bindings.inc.rs',
+  include_directories: bindings_incdir,
+  bindgen_version: ['>=0.60.0'],
+  args: bindgen_args_common + _qemu_api_bindgen_args,
+  )
+
 _qemu_api_rs = static_library(
   'qemu_api',
   structured_sources(
-- 
2.49.0


