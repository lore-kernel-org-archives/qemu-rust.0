Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772B9D59D99
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3LS-0000YJ-Mc; Mon, 15 Dec 2025 02:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LQ-0000Uj-Qw
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LO-0000j9-M3
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkqwtBez6ruMhapFvtBLLST/9OLLA0Ok8S5sc7t4FZ8=;
 b=LGaBMqfvCtQQgZAQWZ5Wx2Y0JWxF+PWbmTnxDUyJy3WgrroBOSsIe8qeTgV1N2sw60Ri2E
 2JWAkFei5GrEkhfn8A4a2QT3f3SJm0ObvE2Pso+kIWFNkGR5aUSG0pilZeCKroFTXVFNJI
 uzEFFvrS6SuOGv4oIudGv4tHB0sy1mA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-7fQlt8vAMxuaWc3EL9l6DA-1; Mon, 15 Dec 2025 02:50:07 -0500
X-MC-Unique: 7fQlt8vAMxuaWc3EL9l6DA-1
X-Mimecast-MFC-AGG-ID: 7fQlt8vAMxuaWc3EL9l6DA_1765785006
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430fd96b440so218918f8f.1
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785006; x=1766389806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jkqwtBez6ruMhapFvtBLLST/9OLLA0Ok8S5sc7t4FZ8=;
 b=WErkap/rpQvwq8J9Z4CRjjgwXuR/nPsV6MsYbCatoKQ6QIrbBMghmxOt0ail54H8fT
 zyiFiS3+42SluUYuQE0LrZMdJ/vayLRRRo+ql2EP9UXPghLZp2A86QKqkkeTnrrRxN7T
 8QcPPe9dWon5tc1tk5SDw9hCwGw+Rlw27dVq5qgTW1xJmsoH47IZmgpGJ45XXMR2C2hc
 f6R5qpioWqiNm7KqXuU2jDPs/VZXj1TaZdOCcFpNdbtvnlLHv9CmEKn+OOKRRgte8KAz
 yRCTEIH/Zz22PUYm/ooxcL2pJ0Yah40DaiP3qkF+jq3E+zw9VpjF9BycsQMvmaL1lvRp
 99Kw==
X-Gm-Message-State: AOJu0YybSrD7xjntClDp66L7/YHLo2I8qbELKZs5i6R88YuZmnQVER3R
 vnR6r2+CPLa3YFb6Li65VOPbnZJpw5KWRmc9geHrUWwf94FbQUusTfDUkiCglR66An2jkpiWmmh
 /cWiHNLkoDp5DnW5RaK58oP54Nk+Y9IShya+D2tNIGxaJiBgmnLGAFMI=
X-Gm-Gg: AY/fxX7xRnzXgNgzhBXsJO+AYMjg/FDV7m/lgAC343aYQ545z33XIn9ZE3Kvj3SSdtt
 OYvmWLdlmyboaHpLlGwLVvJPvFOMSk1EL61n3JPqkOQ05o+ULZKQEq5uIS4QX/h7IFzhs+pnC0f
 lVhs/h7DIYAz3J+dnuJY/h5HJo/LeVb+B5VslSuH7nqP8wcU3IVBPcLQmZPU+m86veEmExELzy/
 /TEjMm3KkJVpyCjcllfkh8lR5iu6IRfHub3uOC42vvSMUVGKLJxFd4dkrq+Kfyo7adgFGkNTD2Q
 OcP43pD3hwTX4xaf5fL02n1ksS3U7VeyevG1erIx6Nf9MGr/Fft5zagxbxDVuoX2BJRt2ukMRSF
 ZPSC0y5F3u6FuFYAQ+3RpPBrwHEEJfXVh1T0d2APiQMXlwVLr7fFdjpJ5Vunm+Ya3KUa+W/bdJ/
 ZZK3hqn6CGg8hsBho=
X-Received: by 2002:a05:6000:1843:b0:42f:760a:7661 with SMTP id
 ffacd0b85a97d-42fb44ed4eamr10745115f8f.38.1765785006267; 
 Sun, 14 Dec 2025 23:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk4kX/SIpFBJ6y9yNuduCLcQAXhQ0xCZpg2XdRSPw4uXX5qcx2fxE6WAxDCAvSC0YFRy0YJg==
X-Received: by 2002:a05:6000:1843:b0:42f:760a:7661 with SMTP id
 ffacd0b85a97d-42fb44ed4eamr10745006f8f.38.1765785004324; 
 Sun, 14 Dec 2025 23:50:04 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb0fc8d5fsm20155160f8f.2.2025.12.14.23.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 01/11] build: do not include @block.syms/@qemu.sys with
 modules disabled
Date: Mon, 15 Dec 2025 08:49:50 +0100
Message-ID: <20251215075000.335043-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DcIOg6tp3c1TrAMTSQCZ02EQ6ETxcQjCBlhdtAt1odk_1765785006
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Including specific symbols used by modules is not necessary for
monolithic executables.  This avoids a failure where emcc does not
support @file syntax inside a response file---which in turn breaks
the WebAssembly build if the command line is long enough that meson
decides to use a response file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index e6a11cefdb7..02738c9765f 100644
--- a/meson.build
+++ b/meson.build
@@ -4270,7 +4270,7 @@ foreach target : target_dirs
 
     c_args += ['-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
     arch_srcs += config_devices_h[target]
-    link_args += ['@block.syms', '@qemu.syms']
+    link_args += enable_modules ? ['@block.syms', '@qemu.syms'] : []
   else
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
@@ -4499,14 +4499,15 @@ if xkbcommon.found()
 endif
 
 if have_tools
+  link_args = enable_modules ? ['@block.syms'] : []
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
-             link_args: '@block.syms', link_depends: block_syms,
+             link_args: link_args, link_depends: block_syms,
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
-             link_args: '@block.syms', link_depends: block_syms,
+             link_args: link_args, link_depends: block_syms,
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
-               link_args: '@block.syms', link_depends: block_syms,
+               link_args: link_args, link_depends: block_syms,
                dependencies: [blockdev, qemuutil, selinux],
                install: true)
 
-- 
2.52.0


