Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA39C5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 13:47:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvxfj-0003hW-Oy; Mon, 17 Aug 2026 09:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxfA-0003TM-OW
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:46:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxf7-000212-Hn
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786974360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxvOSeZ368LKK/fAnlZv7h/Kqab1FwSa+jkutPOie98=;
 b=WICguZu1bKenk+wRm88KGGDfagEyJYoylgehRADNUIFClKL3zAhyM/AbCnAv+LH5/i6ufG
 vu/4hyCW6+38SnLBEuWkhHVGBXxSQBBqH6WOeJmOeH+yu84Z9okq6NG904PTelY00qia2d
 oc/Cy+Na9SAHoXCVCL2weEW2gDJVpQY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-lWaZh5AoOgSwc6fhS4wp_Q-1; Mon, 17 Aug 2026 09:45:59 -0400
X-MC-Unique: lWaZh5AoOgSwc6fhS4wp_Q-1
X-Mimecast-MFC-AGG-ID: lWaZh5AoOgSwc6fhS4wp_Q_1786974358
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-473ac08a6a4so2364756f8f.0
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 06:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786974358; x=1787579158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xxvOSeZ368LKK/fAnlZv7h/Kqab1FwSa+jkutPOie98=;
 b=WSPl5sKyseWrCBnWEt9r3vEnsgeb0kv1eCPaq0eP/JzdkV+J39RP9LxpGs/omjECVu
 Z0WvawSrt4PRRPPT3jbClIvpE5RLpUh3/8j3wyfMEdfvwIF7PJuxr+Jk3BKVZbeB9mQR
 5Q87lmANDKfIvt3VikiGIOVk0ClsJYCf+bnzgfxj+vBulDJevi+x4HeGVzLr753+SKFm
 hxbnwMONlaOFZfxhctio6K24vAu/2f8qgTWeJxOP9TFooZrghLrJgjfNAh3cXHh0Lm6d
 GsFCYjtNkSTsZ0PMsRi1jE7zmVnBbpolLpWXRageTUF/YOBhLfQyW998+7B/S1q8vaFb
 hhXQ==
X-Gm-Message-State: AOJu0YyGr8fbRtUN7B6U/fL2FG0FGi5PqPTCo5ZBe+QQaS3D0k8ahwvc
 lbwZeRNJ+pelQxtsUT9W2nR9g2I4T9+yi/cnhxjuM7FVDYxEPETVB3qA10XJzPHKB4+S5CSprc2
 7bSmnxWySQXuuEUxEKf8CKR+VD3M0tiEwlnqknCRubKQneiA8jyF5YUU3P3m1J9w=
X-Gm-Gg: AR+sD10geyE5QAs0fM9UxuCFmYuZyo6LuZSnIHcXJo4k+c1WTKeY0v4WXoqWc0WgeSF
 iSg9aYOu/YKXr7GPHqy5SZ+QWn1uqA17mrlHqh8nQvovRD36Jr9P8wVS3/NV8gB5VXMoAK+Z7Qc
 zrjL/oobHvpAlKUhgHQm4TQWqlRqkAY90lZLLOF6xf1JcA01TyEXxc175B9yNkoxiIhLBKCYlz8
 VO/SYnMBoi6ye5f21Af6T0GHT+fDlH7oFwn937E3kQeABp7OPvuW0MsWfnM8etNwXyAvYSv9YjW
 B3lLTa3yirIKPsu1WyDzXOm3evEw/KZ11g5hHKMuPc6FDwAj/wGHvi1adeTJ45xd1atIdGXXwEo
 /NnqH0CzkVMP1kn23UYLoEGbxwpfOdvyd3vfaZhKbYqc4s2vqB6H1sn01XDBPwffEwo30rbt0cr
 1mH78=
X-Received: by 2002:a05:6000:41c4:b0:482:a36c:a5cd with SMTP id
 ffacd0b85a97d-482a36ca830mr8728101f8f.20.1786974358195; 
 Mon, 17 Aug 2026 06:45:58 -0700 (PDT)
X-Received: by 2002:a05:6000:41c4:b0:482:a36c:a5cd with SMTP id
 ffacd0b85a97d-482a36ca830mr8728007f8f.20.1786974357618; 
 Mon, 17 Aug 2026 06:45:57 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b660sm4240968f8f.15.2026.08.17.06.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 06:45:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 7/9] docs: rust: update for new-style build rules
Date: Mon, 17 Aug 2026 15:45:35 +0200
Message-ID: <20260817134538.924615-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817134538.924615-1-pbonzini@redhat.com>
References: <20260817134538.924615-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qfpkcYioI-xoi4V-N75VRCvjw0yjZ8lcr9l2l7InHCE_1786974358
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 83 +++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 56 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index af142c4a694..6ebd4d33431 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -21,15 +21,11 @@ invokes rustc directly, building static libraries that are then linked
 together with the C code.  This is completely automatic when you run
 ``make`` or ``ninja``.
 
-However, QEMU's build system also tries to be easy to use for people who
-are accustomed to the more "normal" Cargo-based development workflow.
-In particular:
-
-* the set of warnings and lints that are used to build QEMU always
-  comes from the ``Cargo.toml`` workspace file
-
-* it is also possible to use ``cargo`` for common Rust-specific coding
-  tasks, in particular to invoke ``clippy``, ``rustfmt`` and ``rustdoc``.
+However, Meson is able to consume ``Cargo.toml`` files and tries
+to be easy to use for people who are accustomed to the more "normal"
+Cargo-based development workflow.  In the case of QEMU, in addition,
+it possible to use ``cargo`` for common Rust-specific coding
+tasks, in particular to invoke ``clippy``, ``rustfmt`` and ``rustdoc``.
 
 To this end, QEMU includes a ``build.rs`` build script that picks up
 generated sources from QEMU's build directory and puts it in Cargo's
@@ -466,63 +462,38 @@ Adding dependencies
 Generally, the set of dependent crates is kept small.  Think twice before
 adding a new external crate, especially if it comes with a large set of
 dependencies itself.  Sometimes QEMU only needs a small subset of the
-functionality; see for example QEMU's ``assertions`` module.
+functionality; see for example QEMU's ``assertions`` module.  Also,
+choose a version of the crate that works with QEMU's minimum supported
+Rust version (|msrv|).
 
 On top of this recommendation, adding external crates to QEMU is a
 slightly complicated process, mostly due to the need to teach Meson how
-to build them.  While Meson has initial support for parsing ``Cargo.lock``
-files, it is still highly experimental and is therefore not used.
+to download them.  While QEMU uses Meson's support for parsing ``Cargo.toml``
+files, it ships ``.wrap`` files instead of using ``Cargo.lock``; this way,
+distros can adjust the set of dependencies to the exact versions they use.
+The versions specified in QEMU's ``Cargo.lock`` must be the same as the
+one in the wrap file.
 
-Therefore, external crates must be added as subprojects for Meson to
-learn how to build them, as well as to the relevant ``Cargo.toml`` files.
-The versions specified in ``Cargo.lock`` must be the same as the
-subprojects; note that the QEMU source tree forms a Cargo `workspace`__,
-and therefore there is a single lock file for the whole build.
-
-__ https://doc.rust-lang.org/cargo/reference/workspaces.html#virtual-workspace
-
-Choose a version of the crate that works with QEMU's minimum supported
-Rust version (|msrv|).
-
-Second, a new ``wrap`` file must be added to teach Meson how to download the
-crate.  The wrap file must be named ``NAME-SEMVER-rs.wrap``, where ``NAME``
+The wrap file must be named ``NAME-SEMVER-rs.wrap``, where ``NAME``
 is the name of the crate and ``SEMVER`` is the version up to and including the
 first non-zero number.  For example, a crate with version ``0.2.3`` will use
 ``0.2`` for its ``SEMVER``, while a crate with version ``1.0.84`` will use ``1``.
 
-Third, the Meson rules to build the crate must be added at
-``subprojects/NAME-SEMVER-rs/meson.build``.  Generally this includes:
+Usually, Meson is able to figure out how to build the crate, and also handles
+cross compilation correctly.  For crates that have a ``build.rs`` file,
+equivalent rules must be added to
+``subprojects/packagefiles/NAME-SEMVER-rs/meson/meson.build``.
+The file can modify the ``extra_args`` and ``extra_deps`` variables,
+which contain respectively the compiler arguments and external dependencies
+for the crate.
 
-* ``subproject`` and ``dependency`` lines for all dependent crates
+After every change to the ``meson/meson.build`` file you have to update the
+patched version with ``meson subprojects update --reset ``NAME-SEMVER-rs``.
+This might be automated in the future.
 
-* a ``static_library`` or ``rust.proc_macro`` line to perform the actual build
-
-* ``declare_dependency`` and a ``meson.override_dependency`` lines to expose
-  the result to QEMU and to other subprojects
-
-Remember to add ``native: true`` to ``dependency``, ``static_library`` and
-``meson.override_dependency`` for dependencies of procedural macros.
-If a crate is needed in both procedural macros and QEMU binaries, everything
-apart from ``subproject`` must be duplicated to build both native and
-non-native versions of the crate.
-
-It's important to specify the right compiler options.  These include:
-
-* the language edition (which can be found in the ``Cargo.toml`` file)
-
-* the ``--cfg`` (which have to be "reverse engineered" from the ``build.rs``
-  file of the crate).
-
-* usually, a ``--cap-lints allow`` argument to hide warnings from rustc
-  or clippy.
-
-After every change to the ``meson.build`` file you have to update the patched
-version with ``meson subprojects update --reset ``NAME-SEMVER-rs``.  This might
-be automated in the future.
-
-Also, after every change to the ``meson.build`` file it is strongly suggested to
-do a dummy change to the ``.wrap`` file (for example adding a comment like
-``# version 2``), which will help Meson notice that the subproject is out of date.
+Also, after every change to the file it is strongly suggested to do a dummy
+change to the ``.wrap`` file (for example adding a comment like ``# version 2``),
+which will help Meson notice that the subproject is out of date.
 
 As a last step, add the new subproject to ``scripts/archive-source.sh``,
 ``scripts/make-release`` and ``subprojects/.gitignore``.
-- 
2.55.0


