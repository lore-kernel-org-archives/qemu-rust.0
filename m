Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D16D59D99
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:52:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3Lr-0000fJ-FE; Mon, 15 Dec 2025 02:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LX-0000b9-82
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LV-0000ll-II
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlW7wtP3S7BSZhssQjq1auHlBWMlcMZTjjKdz6k84jU=;
 b=aNbCH7yv6kkCdmg8Z33SS+t+cfbA0yZF9I4jKOABapG84fQru1swRJL3K1P9CKrE3NszjS
 8budoQ2xM1j29QSOargF4J14Np7g838+W6JVbOTcZUlxFZpOLy8o1TRDHCRIsBp6yP0Nw7
 ZXNLicJFnsPsjlB8la+MyV95QJLJs58=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-Jp02xMu6PReyNDScsBj5QQ-1; Mon, 15 Dec 2025 02:50:15 -0500
X-MC-Unique: Jp02xMu6PReyNDScsBj5QQ-1
X-Mimecast-MFC-AGG-ID: Jp02xMu6PReyNDScsBj5QQ_1765785015
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4779981523fso30093965e9.2
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785014; x=1766389814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TlW7wtP3S7BSZhssQjq1auHlBWMlcMZTjjKdz6k84jU=;
 b=H4oO2+aqVtvgFM/21L/TNcGdLvaqVbydpphPeLfxCNy1YUss1kqaderRDwp13+ooeY
 3L3aplaTv7vQaoCpVQNScjGOrxbkaihJIQ+DFVXpp6Y1Ta5K5OLdkxeWJD9ZZ+cgKrqJ
 3UqmTwSi/kr0LFIHssW+QcwsZQ9/0OzKaGfpJ1MbKHlCLTCyTqD0i4rc0vH0stHF+3NC
 smamrQbF72SWQ+QuWYJaukRt1lrLn9nGAJVbB36mGV3ULakYslJ2ElypqxKYp9wW4qEa
 9ysvchbuvL9cpQ9scQx4dF8AtrX3JXyK4JxOO0dLw25NvpxDbOt+Uj34zC8C8In1eWBD
 y5MA==
X-Gm-Message-State: AOJu0Ywc9YT3CeGtcT/YrXgKlv123siCvRNkDNwe5+gDsun1IM2Xfnzu
 rtf//MFcmXv3mNGAFSKdFJHJsdtWa5Pjcw39TgpaYgGu8ecvUTPPMkoAiOH+qYYI5dQZ3c4fDDj
 9f5Xg8kaALdpATpQ8mdjZKetWA97hFliLWdsPlisYeaHdXtm5AeTRJByqeWtftqo=
X-Gm-Gg: AY/fxX5Ebs+cFnIWlG8sywBSmKKVnbvnHmx6EWmYjIBduiAANgD5qJA1VvN1XLh56/g
 sPtqbrxSZEPeWi9Q/N1vzYRnzFUqv1AN1814kXfCvKZVWEzCoNglE2DZJR0Hh14Dmfh73f2OTM7
 3Y2cI4ZV6UInzgF758r6H4zWVc5jBHeJt8SaTB+0klMTe81gIw3zMUgNt+r8gJYE5dbY/6ircPh
 mR6DGXkkgLCCacRci19k3ijXI3wE3FjQ2Ie52x/Ks2gvuKRRsy3d5e7mD/9EVVaiPMb7U2YTQbz
 9aS4Sfcww6A/azP8Pd2/KSHDVq/EhXyKSM9kNS64RTsRH3XZiHvvAhOn8ZHr7Srf3JWlGEHgi7x
 jggeYnFMWDrKlcL/Wui3EjEQUEjSkN4ql9ZmAcqu7BLU39trMREouZQ8D/U0HleKg7AW7TAnJXp
 C/Ik2FLmuhi8L+rAM=
X-Received: by 2002:a05:600c:4e91:b0:477:c37:2ea7 with SMTP id
 5b1f17b1804b1-47a8f904609mr104987805e9.21.1765785013705; 
 Sun, 14 Dec 2025 23:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjNGTw3rR71LFrJggoEPZa2W3FOLAe6o0RAXtCN9YS+s1RCdf7zA9dPxCtSG8SqIKOWz8MFw==
X-Received: by 2002:a05:600c:4e91:b0:477:c37:2ea7 with SMTP id
 5b1f17b1804b1-47a8f904609mr104987625e9.21.1765785013256; 
 Sun, 14 Dec 2025 23:50:13 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4f424bsm173496925e9.10.2025.12.14.23.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, marcandre.lureau@redhat.com,
 Martin Kletzander <mkletzan@redhat.com>
Subject: [PATCH 04/11] rust: Do not link qemuutil into Rust rlibs
Date: Mon, 15 Dec 2025 08:49:53 +0100
Message-ID: <20251215075000.335043-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rjewyGb32t7bQx847L9vKKanZwsWMeg8iZAS5AqOuCk_1765785015
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

From: Martin Kletzander <mkletzan@redhat.com>

Commit de037ab8d83d removed qemuutil dependency from chardev and util
rust crates.  However it stayed in the _util_rs static library.  The
dependency is also defined as `link_with`, which is fine for C targets,
where the resulting archive gets linked as another parameter on the
command line when it is a static library.

However, when a C library is linked into a Rust rlib, rustc remembers
the dependency into the metadata and adds the library to the linker
command line.

Unfortunately, static libraries are sensitive to their
position on the command line and rustc does not always get it right.
Fortunately, simply removing it from dependencies of any rust libraries
and instead adding them into the dependencies of executables and
doctests fixes the behaviour.

Without this patch the error I get is:

  FAILED: [code=1] rust/tests/rust-integration
  ...
  = note: rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          rust-lld: error: unable to find library -l:libqemuutil.a
          rust-lld: error: unable to find library -l:libvhost-user-glib.a
          rust-lld: error: unable to find library -l:libvhost-user.a
          collect2: error: ld returned 1 exit status

Meson could work around it itself by never adding these static libraries
to the rlibs (after all, Meson tracks the transitive dependencies already
and knows how to add them to dependents of those rlibs); at least for now,
do it in QEMU: never link C libraries into Rust rlibs, and add them to the
final build products only.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/chardev/meson.build | 2 +-
 rust/qom/meson.build     | 2 +-
 rust/util/meson.build    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/chardev/meson.build b/rust/chardev/meson.build
index 54bb2962528..2e4f4670bd8 100644
--- a/rust/chardev/meson.build
+++ b/rust/chardev/meson.build
@@ -38,4 +38,4 @@ _chardev_rs = static_library(
   dependencies: [glib_sys_rs, common_rs, qemu_macros],
 )
 
-chardev_rs = declare_dependency(link_with: [_chardev_rs], dependencies: [chardev])
+chardev_rs = declare_dependency(link_with: [_chardev_rs], dependencies: [chardev, qemuutil])
diff --git a/rust/qom/meson.build b/rust/qom/meson.build
index 551c4f0bf5f..dda26c3f981 100644
--- a/rust/qom/meson.build
+++ b/rust/qom/meson.build
@@ -30,7 +30,7 @@ _qom_rs = static_library(
   dependencies: [common_rs, glib_sys_rs, qemu_macros],
 )
 
-qom_rs = declare_dependency(link_with: [_qom_rs], dependencies: [qemu_macros, qom])
+qom_rs = declare_dependency(link_with: [_qom_rs], dependencies: [qemu_macros, qom, qemuutil])
 
 # Doctests are essentially integration tests, so they need the same dependencies.
 # Note that running them requires the object files for C code, so place them
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 95b44f7c670..98629394afb 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -39,10 +39,10 @@ _util_rs = static_library(
     ],
     {'.': _util_bindings_inc_rs}
   ),
-  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, qom, qemuutil],
+  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs],
 )
 
-util_rs = declare_dependency(link_with: [_util_rs])
+util_rs = declare_dependency(link_with: [_util_rs], dependencies: [qemuutil, qom])
 
 rust.test('rust-util-tests', _util_rs,
           dependencies: [qemuutil, qom],
-- 
2.52.0


