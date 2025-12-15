Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F87D59D99
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:52:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3MK-0000w3-E4; Mon, 15 Dec 2025 02:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Lo-0000f1-Qk
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Lk-0000of-8a
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+obehD/6XgLBmBbpDgAeb1sGrtgaFddAnzlpY2bxiQA=;
 b=GSbPUCSjCJ/cpqFUZvPIAC4TdlUuHlqNMNz+zEb7WVLl7k0c1SjY1/+UhPW/DhK0iqXjEL
 qjQKzAWE10BwDOdiKnC/fV45ClDHb3eSCxz3fHyGIdEYbJlAPSvQ+f0X2wDo8g+q+nCBMn
 smAR8m4f6BJvpYe7uOV8nnpcpZccno4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-EGGj3zoROreLrcnNXhwrHg-1; Mon, 15 Dec 2025 02:50:30 -0500
X-MC-Unique: EGGj3zoROreLrcnNXhwrHg-1
X-Mimecast-MFC-AGG-ID: EGGj3zoROreLrcnNXhwrHg_1765785029
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47910af0c8bso22898125e9.2
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785029; x=1766389829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+obehD/6XgLBmBbpDgAeb1sGrtgaFddAnzlpY2bxiQA=;
 b=kGe0XXGvnxfAku+toyVhKbq/CIUk6u1+DbI4aukDzfnrYvtdXUU8bTZZkHNAC+RC3I
 yCJBRx06NaBq8EaRrAo3U4rXLms1U6Xr/YZ9sj4NeK2rV+RKswLbjrQmCS+K6pjBy7ir
 kq7B/Y+rn/NLvFI4E1slRH1gHKGqvvypnCDTOYvZ4BWpZdZQNZMbcnV5IvVLPA+HhNXd
 DIotcsFI2gEHB80rN/nVXRaM/abxOJT3FeauUb+Sm4zHXWi59b6CNe8qBfY7BcsuYor7
 Nt8pfpc/TH4K3ED+3tOrWXDJu9cPvr1mqFGJxlWEggXVM5580KSfy5He84tIo0j1doGR
 7KSQ==
X-Gm-Message-State: AOJu0Yw9BZL9DnsszvzBwXbta/YMB7h9Fdq+a77wxprQjg0WBGLxUFBl
 +q3DnmiyK0s6mJiHJpgNGpRyvJLupJDi70rC10vpeAE2IAtmCQDB6BsgcM0Z2io39jfSg5058rQ
 pzO5AOddylP2VieeGc7fNxVaWhrTgRcMWQgMCKai+RmUJu0aHt+2Wm9QMKdo/peQ=
X-Gm-Gg: AY/fxX4G/GsDrs3CVmXA8iSGDUkA2Z+2LYN4LrgK6np6s4yEJ3VJLTN18j0iZLc42tN
 HLeEqI2Qi081SnhNbAU9geHE5ABYKPwrLRYLJ0fXmXgQP8lVb2S3gL2zr+Rje89sBaDuyM4R3XT
 fXWxgU4u5O4R06Pf2rkVUkVIIfWqYtkAzLzwQPQpKT54i69cqJAYNA2Dx3PKv6LOYaG327fEMWt
 Mr9w+ebQRy9gTzA+sUeo5IGPTRCdSAKTGzemmjUQPrqOqgG5cdPC+704p98wNnbQ5R6B7QpZaNd
 d0HsR3zSwUqGfg5WH7ZJa+sqrEAKpP4LLxU5DRD760Q0OubVREx2Ohmzb1ShBcWmGJyJq75mj1h
 SGWBxFwZq1/xGUjEdQ9YM8OBrHvYAZTflyzIm56Me4s/osVAcFuoFsPiVA0+WqsddFAFmAxEcjO
 KD1DSCKuvWu5aOztw=
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id
 5b1f17b1804b1-47a8f9145edmr92097505e9.36.1765785028916; 
 Sun, 14 Dec 2025 23:50:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrx0ba9CwEUX+fwZExSNytgQwqx1DduT4Ue2KjwyJkPcnfv3FiGzbPtjiXH4eP9ylbR/tn8w==
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id
 5b1f17b1804b1-47a8f9145edmr92097275e9.36.1765785028444; 
 Sun, 14 Dec 2025 23:50:28 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f38a4b7sm173665475e9.3.2025.12.14.23.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 10/11] cirrus/macos: enable Rust
Date: Mon, 15 Dec 2025 08:49:59 +0100
Message-ID: <20251215075000.335043-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V8wI3fnsFnnx9y3Iy53lA_fXVAP7KTxjXY5kWuBik04_1765785029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Link: https://lore.kernel.org/r/20250924120426.2158655-25-marcandre.lureau@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 0d66a14186a..177bd684ef5 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -56,5 +56,5 @@ aarch64-macos-build:
     INSTALL_COMMAND: brew install
     PATH_EXTRA: /opt/homebrew/ccache/libexec:/opt/homebrew/gettext/bin
     PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
-    CONFIGURE_ARGS: --target-list-exclude=arm-softmmu,i386-softmmu,microblazeel-softmmu,mips64-softmmu,mipsel-softmmu,mips-softmmu,ppc-softmmu,sh4-softmmu,xtensaeb-softmmu
+    CONFIGURE_ARGS: --target-list-exclude=arm-softmmu,i386-softmmu,microblazeel-softmmu,mips64-softmmu,mipsel-softmmu,mips-softmmu,ppc-softmmu,sh4-softmmu,xtensaeb-softmmu --enable-rust
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
-- 
2.52.0


