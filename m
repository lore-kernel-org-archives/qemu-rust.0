Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233CACAC5B0
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Sep 2025 12:10:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1OJX-0005eG-Dl; Wed, 24 Sep 2025 08:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1v1OHg-0002on-JN
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1v1OHP-0006HH-4M
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758715644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msb4UKtvSLmS0DJSTxPJEEU5eRGOe9nc3237xngWKRs=;
 b=GcH+dE6DlFe0O79ax3JCo2pKLJoP23ViY2ZbNK/yKh7svr1MjP5hduIZS0zAbfsx9pqdO3
 UtEwaarS2b5U7Y3k5i5P4RNnAt3ImYUJg8WLdiVXbLb2IIoWXJAVzMVWb5haSxkBUavSLg
 A+S8maifFP6WqtgK5aID//xVnhBjKXo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-XVTg6pKHOtKqjnD2oC-ZGA-1; Wed,
 24 Sep 2025 08:07:22 -0400
X-MC-Unique: XVTg6pKHOtKqjnD2oC-ZGA-1
X-Mimecast-MFC-AGG-ID: XVTg6pKHOtKqjnD2oC-ZGA_1758715640
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 71D6F180034A; Wed, 24 Sep 2025 12:07:20 +0000 (UTC)
Received: from localhost (unknown [10.44.22.38])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A277319560B1; Wed, 24 Sep 2025 12:07:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, qemu-rust@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: [PATCH v2 23/27] WIP: gitlab-ci: enable rust for msys2-64bit
Date: Wed, 24 Sep 2025 16:04:20 +0400
Message-ID: <20250924120426.2158655-24-marcandre.lureau@redhat.com>
In-Reply-To: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Currently fails with meson issue:
https://github.com/mesonbuild/meson/pull/14991

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitlab-ci.d/windows.yml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1e6a01bd9a..51297d3647 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -17,7 +17,7 @@ msys2-64bit:
     # This feature doesn't (currently) work with PowerShell, it stops
     # the echo'ing of commands being run and doesn't show any timing
     FF_SCRIPT_SECTIONS: 0
-    CONFIGURE_ARGS: --disable-system --enable-tools -Ddebug=false -Doptimization=0
+    CONFIGURE_ARGS: --disable-system --enable-tools -Ddebug=false -Doptimization=0 --enable-rust
     # The Windows git is a bit older so override the default
     GIT_FETCH_EXTRA_FLAGS: --no-tags --prune --quiet
   artifacts:
@@ -76,6 +76,7 @@ msys2-64bit:
       bison diffutils flex
       git grep make sed
       mingw-w64-x86_64-binutils
+      mingw-w64-x86_64-ca-certificates
       mingw-w64-x86_64-ccache
       mingw-w64-x86_64-curl-winssl
       mingw-w64-x86_64-gcc
@@ -86,6 +87,9 @@ msys2-64bit:
       mingw-w64-x86_64-pixman
       mingw-w64-x86_64-pkgconf
       mingw-w64-x86_64-python
+      mingw-w64-x86_64-python-certifi
+      mingw-w64-x86_64-rust
+      mingw-w64-x86_64-rust-bindgen
       mingw-w64-x86_64-zstd"
   - Write-Output "Running build at $(Get-Date -Format u)"
   - $env:JOBS = $(.\msys64\usr\bin\bash -lc nproc)
@@ -96,10 +100,12 @@ msys2-64bit:
   - $env:CCACHE_MAXSIZE = "500M"
   - $env:CCACHE_DEPEND = 1 # cache misses are too expensive with preprocessor mode
   - $env:CC = "ccache gcc"
+  - $env:LIBCLANG_PATH = Join-Path -Path $PWD.Path -ChildPath "msys64/mingw64/bin"
   - mkdir build
   - cd build
   - ..\msys64\usr\bin\bash -lc "ccache --zero-stats"
   - ..\msys64\usr\bin\bash -lc "../configure $CONFIGURE_ARGS"
+  - ..\msys64\usr\bin\bash -lc "make V=1 rust/util/bindings.inc.rs"
   - ..\msys64\usr\bin\bash -lc "make -j$env:JOBS"
   - ..\msys64\usr\bin\bash -lc "make check MTESTARGS='$TEST_ARGS' || { cat meson-logs/testlog.txt; exit 1; } ;"
   - ..\msys64\usr\bin\bash -lc "ccache --show-stats"
-- 
2.51.0


