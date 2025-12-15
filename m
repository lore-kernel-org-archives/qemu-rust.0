Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE21FD59D99
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3ME-0000s9-Ml; Mon, 15 Dec 2025 02:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Lk-0000dv-Q1
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Li-0000oB-34
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0bWfEi5YvsxXPan+R5X2P9dFKSiDKmgH0HJ5Od8B3k=;
 b=ZiRn7xaCF7UI94dqpR5nslEpsK0FtC8LI0UAUUjUTvu1UQ1YjbqbznxTwllFs0awRp0V6Q
 t+k+QHzh3szGdGaagbLXp7/zMMlnCjs3XaqpmwIe1IIVoh1wRQlghV1rEmLwNpW4d13u7z
 tE6WbAscTvwY61Ty9P+J3zrf/BSFpYs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-n75UjcuoNuacC5YEuHEkvQ-1; Mon, 15 Dec 2025 02:50:28 -0500
X-MC-Unique: n75UjcuoNuacC5YEuHEkvQ-1
X-Mimecast-MFC-AGG-ID: n75UjcuoNuacC5YEuHEkvQ_1765785027
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47788165c97so3306055e9.0
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785026; x=1766389826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+0bWfEi5YvsxXPan+R5X2P9dFKSiDKmgH0HJ5Od8B3k=;
 b=iFG7sOjquSFu23s9EhTVkmx1BABpocCv17LvF7QYtTZdVwpkekz5aKxPoK8G7JeLP6
 tjK3fHs6U85qSlF15bETgl/SmNUwRN7HakjkbkJrD5TXuKE/T6lbK2TZkfXv0cbfmKZ2
 8nXr5kvk1CUUvwNNFm37snedB21HbPHM4aK2CGgOv46XkVr4im491S9AuRadBQT0t9z9
 RU5twdNEmvO7ZBUUySRkT7PPcwXmLAoQDsn0+cNeZ3GHncLzADez5EKw9VJK5CMGgZTx
 zTiwYiFhI+7F4kVn+OamZ5cx08h6+/zj3OXE5rl+IAfhE9zonXvF8PWyNCLT0GDrOhVX
 zzSQ==
X-Gm-Message-State: AOJu0YzMvSbeDageiEnoDJjKgiOUQ5bXllNwfiPMX7YWjuWTYbtL2LqV
 1eIpj0W89UW5tTxIJrsm1SKRS5qsyF1cpx4ifbj6e32WHZV4M3nY8fSeHoV6FL9YEzViqTylO8Q
 XxLVKj0MnK/W7a6U6/3tmhJfT9t6HyVCotpPSCtsnoT7J65F6TzDptNkmlIJxOg0=
X-Gm-Gg: AY/fxX4ArY3SdRNz7f96B5cboZAuOGRN5CFlyebLtfA+d1PhZcrKjczm5D5C4xk8Qzz
 8fVA4j+Ov5fQ/xRjStLNIzleYKPDiowE0mdcGHpRb+BljbwGH+NygfACVaDOG4oFjNjxaQ5cKwv
 CwaE4z0Uua28SBbj2jqu4UxaoJVFDfNKQwmOxD12J/UCg1sD1rNQG5mk2ewRNyuCQu0FgXh6mcC
 5sAjMYv6ma2zTerDUXCbzuIvJc9TcHWrtDfxqGedU2ZO0pEZ30T1IcPGK1vGQEZhvXIsjOdJvA4
 GkICo+i6E3oEGYLmYjOHIc5895bwd5IVVwrMjyeqtAi4T1+AyA4g1wXUJRpIFvej7ZUIinpkctx
 +fDougPxXh3WYhIRmnh63mzRyyxbogADnsqXL2Dp6DnFb1+NtbXxjFxn0GBe7sU+HFjOEaPz5xe
 XnqiWJ1HTJQH+y0Wo=
X-Received: by 2002:a05:600c:6291:b0:479:3a2a:94e7 with SMTP id
 5b1f17b1804b1-47a8f8b1449mr101944825e9.10.1765785026338; 
 Sun, 14 Dec 2025 23:50:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFp03gBJKeoB+vrkkQzMXKYMOJfHNSIDf9/2sLNziUm3xHT7/4zXr5bXR76DTD24IPowu2Dw==
X-Received: by 2002:a05:600c:6291:b0:479:3a2a:94e7 with SMTP id
 5b1f17b1804b1-47a8f8b1449mr101944705e9.10.1765785025973; 
 Sun, 14 Dec 2025 23:50:25 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f768936sm175988655e9.6.2025.12.14.23.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 09/11] lcitool: enable Rust for Windows cross targets
Date: Mon, 15 Dec 2025 08:49:58 +0100
Message-ID: <20251215075000.335043-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: USiboO-__Jut9rp1vM8OvTFTEJp1STQSoykSSr8E8c0_1765785027
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

The issue that is mentioned in the comment has been fixed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 ++
 tests/lcitool/refresh                              | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 4f743c00434..c5e1fcebf51 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -120,3 +120,5 @@ ARG USER
 ARG UID
 RUN if [ "${USER}" ]; then \
   id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
+
+ENV ENABLE_RUST 1
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 9df607a55f8..01a71929542 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -291,10 +291,7 @@ try:
                         project='qemu,qemu-win-installer',
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
-                                            "x86_64-softmmu"),
-                        # linking with rust is buggy:
-                        # https://github.com/mesonbuild/meson/pull/14991
-                        enable_rust=False)
+                                            "x86_64-softmmu"))
 
     # We also generate some docker files with minimal dependencies and
     # as many cross-compilers as Debian will package for building TCG
-- 
2.52.0


