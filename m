Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D8D5B172
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3M4-0000kp-JC; Mon, 15 Dec 2025 02:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Lg-0000cc-8j
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Ld-0000ms-1Z
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rh8EAU3Vu8iISu05eCtJPhE7/fLdZf4qcNAXE0aot+8=;
 b=cKrvS5SoUp0lQyZKBBsi2VYOqEQKEqxsm41o3fLyG9ypD+XZ7v5vcl7KNq1Tn9n/t5/jP+
 fc5RXpmjJ6iQvx3ha9KbsGEyqR9XG4HM1+mlc7qn5gwzmAyho16oz6oQ3QVI4ENCZB2V69
 EVEoeM9o3oO3Iq+iD1KADuyLxnPB+L0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-VRC_rStWOoyyi7OVjiGXFA-1; Mon, 15 Dec 2025 02:50:23 -0500
X-MC-Unique: VRC_rStWOoyyi7OVjiGXFA-1
X-Mimecast-MFC-AGG-ID: VRC_rStWOoyyi7OVjiGXFA_1765785022
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47910af0c8bso22897635e9.2
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785022; x=1766389822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rh8EAU3Vu8iISu05eCtJPhE7/fLdZf4qcNAXE0aot+8=;
 b=RcYR+lF8gYBODc3qpo/bCG8jSxv/fTVrM78JgYoM/58QPI77cVvMRo6i0MTZLvl6J8
 VJbXVDe5g9RJy3KRzzyTI0v9ZFAC+KEkhsCpJ1oLekYIet7KDY5BYdubZaQEm76MJD8R
 xPe3YybA76SMgLz4+SkJMuBCTe02qlMcZ5+plYJByoAuD2/nUFjeRmKDdOCRevFbmlne
 bxUvUsOz+eeLo31paKrOauMSNd/E8nhF3ZS4/FQt+rAd8WREMS27dnD4o7CDPxyqOWhi
 TYsNWkM2gWv5Fn73dxN5Y8wbDc+MiKoi1FNZINDRQciFznE+qgBQy2HDhdKkLvszZBXp
 bILQ==
X-Gm-Message-State: AOJu0YyDFIwsP5X7YDJjFjPAXzXyhf8xV8teqCQIuWVai8nyz9zPE7cM
 ivQZkJ/6VVdXaMaSbjRzuP73XpFgNab2H5eyIgVlJdvRGSQPJwKcvx4hUgPINd2fkmmRQuWespP
 iIOKJKoNGwyFaV5s1xEyqo6HGqnWpnKJwFg4cVNURvMjb0PeW9bQV/AU=
X-Gm-Gg: AY/fxX730Qx08lhO5xX++Ht1PbYbAHZb/19QskkGqYsHBiCXY/CsPTg/iznC/beWyBN
 S8Z3L2KN/dxDmUzC+UYop/vjK+7+yuQWfgD/gAdqQQDdMtN+19fmj2uSllKMg+ZZOTPI8uBWUWN
 KkZPEbKLWACBqayJVsKnE6N1AZlL5KZqN0t6rSiy7d2B6ejJgrQwlBBpGiiEELjL3WH6GhX9PYd
 LmpD8uutpSdHKEpJdP3Qj9rKNfWixzeORMk8HmvCupBcMzpMvVT1nMBxica2x4tJHeJtM3feszH
 zM13C/6jVosV3NWDUM9d4Da+SaOluVbufAtQezY0WpzdXHiHwQZs+fSXYyZ5DRlCGhkjpu0P8fM
 2S8T8VUSSUedbjO1XHd48FfJQbPfjKD7sn/EGawETAMCwl/V9XEJe+uXNM3vxZvqj2xiAnjMoHR
 JJUXw4mdeGKfTjYvM=
X-Received: by 2002:a05:600c:a46:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47a8f8a7d03mr100417105e9.4.1765785019500; 
 Sun, 14 Dec 2025 23:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtv9ezhZRY3pkF6AFLP3UrJmNyaVU51P3R20WD4pyhJfihgmNoXy61W823BKutfB1Wsn/5MQ==
X-Received: by 2002:a05:600c:a46:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47a8f8a7d03mr100416895e9.4.1765785019123; 
 Sun, 14 Dec 2025 23:50:19 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f33d082sm67841095e9.0.2025.12.14.23.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 06/11] rust: Meson now adds -Cdefault-linker-libraries
Date: Mon, 15 Dec 2025 08:49:55 +0100
Message-ID: <20251215075000.335043-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rk7sRsT7hmmmA1hJLQ8I6wtbKbbn3nwI5lyuGUR2a14_1765785022
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 02738c9765f..e2de3832ac3 100644
--- a/meson.build
+++ b/meson.build
@@ -136,13 +136,7 @@ if have_rust
     rustc_lint_args += ['-Dwarnings', '-Funknown_lints']
   endif
 
-  # Apart from procedural macros, our Rust executables will often link
-  # with C code, so include all the libraries that C code needs.  This
-  # is safe; https://github.com/rust-lang/rust/pull/54675 says that
-  # passing -nodefaultlibs to the linker "was more ideological to
-  # start with than anything".
-  add_project_arguments(rustc_lint_args +
-      ['--cfg', 'MESON', '-C', 'default-linker-libraries'],
+  add_project_arguments(rustc_lint_args + ['--cfg', 'MESON'],
       native: false, language: 'rust')
   add_project_arguments(rustc_lint_args + ['--cfg', 'MESON'],
       native: true, language: 'rust')
-- 
2.52.0


