Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57332D6E2D1
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Dec 2025 18:19:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vWIaw-0006Vc-KI; Thu, 18 Dec 2025 13:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaM-0006Ob-RO
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:18:54 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaE-000307-Ls
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:18:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so5194735e9.2
 for <qemu-rust@nongnu.org>; Thu, 18 Dec 2025 10:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081917; x=1766686717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ek0ZqoV7lcVrfafX0nJ7A9JZOJmPGubRBeO+HIeHC5Q=;
 b=Kr7NUEy9FLMSOKfMb6KPsUrxrG9HBpd/Oc7cMiAeJvJoH0kr9bAeL0iHehwU2ffpGH
 BlzciRw5U1k0oIV8eW1kowIJSVs/kaM2L1ysI55FnvBJQ+aJbq+iHCL2mh7BFgbiLNEo
 winWIgHNIGdWoXTdhDVYKQseqAlVi5b8fkcS7s3bZW0E8AXKapNiChBojwEKBIZJ/iNG
 t6u28alNDV1U057SG6N0+bn2zUHOK5U5a3rNV2/NYYoHf5lr7CCnjafnpcni7sQ1KRcM
 V0C4uupZbpPKc7KmQARNJcWfT4fUl2mcUke3O/rJuKChFYyFqKb9hGhUAu9WkUOWXmB2
 eKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081917; x=1766686717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ek0ZqoV7lcVrfafX0nJ7A9JZOJmPGubRBeO+HIeHC5Q=;
 b=Ys4lV6FRAm2S4y8rTDuISGfmZHDezPEmRGXEXzLzPhruG3nlFGW7uUNRMqJnexnwGz
 A5Nxi9roflCrJ3a3n7IQYS+japxjRgwJlqm2MLm7nD5VUaJHCcaOgkPZ1v08R+aSELRE
 z3PhxhzipYcCseAB0XcMXirZwiT/rQb7crlpdziNkBDlC4waXqcgK7oXfy0F/q2oEei/
 muFXPDy1s+FqMgURhiacku1qX0wnx4td6I0+zKeXlGnOczvQh+7O6mCKb6AuI9tYI6vc
 FPwF4neM5R0a9z7shQzqowZ4WDw4QxgH7gMcCZDL5o4TvuT/Mz5Hod4Upj+fxBoJOUYw
 8eYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKawVXqyWAQbYTWRj3u0ANoMpWdQ7JuCfl306pJjxrkF94ty6UbAvXZcnHQyKlD08uDXGFk9KPo+E=@nongnu.org
X-Gm-Message-State: AOJu0Yw+LxU12X+I/dQFAWb5iagn9HYmzE/IT/BXasmdPTX5OCD2oEHa
 Yx6XbxdHUl7xZC11Ef2aL8cm26wIBPqKIQt701fPltzjdcqwIbnl5iCM3oy/OyaO+rg=
X-Gm-Gg: AY/fxX62Qd2mAR8Ud78jb1hLJNLre25N7mXlh90lBog5EsloeXP2A5rX+JrVFFB0mXc
 ZazODM8xsI/Sl08YQwROfxId2ziU/CC+Xmoxs8AZTLQAhvGo6hFpGi6GhJEu8+anE8aiWyyZiQp
 8wROduol7utwe+gPKZ2PXoGh8Kq3mFaxkiYi4KdRXu2vxUXE2JEbzzXNisW1DnQkTFS8TEJ+Unw
 t0ZBZ9a/r7XGYhQm8b0teYfGqypkxHz3KQsNvIs7hAHDodLCpYlWvb9l0IwXrj3Xvyao7RXsxc5
 I1jVq84omUNSsgdxsJqvLdnCFibELxbUyMQVUPbkO2K3CIcNx/o/3jg5zBnBw1pKctoBpxFxQhd
 m4K1+Cpom4l4zvi5jOtvWe40G3WT4MknDJ3/jU5T4BIdwT39h2D0nakB1gLHuxj8ArKvbet1e+9
 l6VtXKDQRCLklvF5uitg10Plp6LFwW9XZAH/gvUtVia6W+INlvBy0ocQsrdL40
X-Google-Smtp-Source: AGHT+IG3rBj8MLgy5ArgGS6tuUNGiYQve0lqqiTO86Ek4KJMvYwdpNN/K3yJIGq4tWTBYEXioVJH2g==
X-Received: by 2002:a05:600c:8208:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-47d1958d960mr769485e9.32.1766081916568; 
 Thu, 18 Dec 2025 10:18:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be279c5f8sm52622545e9.9.2025.12.18.10.18.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] hw/display/ati: Access host memory as little-endian
Date: Thu, 18 Dec 2025 19:18:08 +0100
Message-ID: <20251218181812.58363-4-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218181812.58363-1-philmd@linaro.org>
References: <20251218181812.58363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

ati_2d.c is part of the ATI_VGA component, being built with
the hw/display/ati.c file. Commit 339534d4025 ("ati-vga: Fix
indexed access to video memory") made access to host memory
using little-endian order. Assume the same order is used for
the 2D component.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/ati_2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index 309bb5ccb6c..72fde6b8008 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -221,7 +221,7 @@ void ati_2d_blt(ATIVGAState *s)
             for (y = 0; y < s->regs.dst_height; y++) {
                 i = dst_x * bypp + (dst_y + y) * dst_pitch;
                 for (x = 0; x < s->regs.dst_width; x++, i += bypp) {
-                    stn_he_p(&dst_bits[i], bypp, filler);
+                    stn_le_p(&dst_bits[i], bypp, filler);
                 }
             }
         }
-- 
2.52.0


