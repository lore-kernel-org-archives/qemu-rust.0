Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E47C55162
	for <qemu-rust@archiver.kernel.org>; Sun,  2 Aug 2026 17:18:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wqZpq-0000Gd-Jp; Sun, 02 Aug 2026 13:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phind.uet@gmail.com>)
 id 1wqZba-0006SV-QJ
 for qemu-rust@nongnu.org; Sun, 02 Aug 2026 13:04:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phind.uet@gmail.com>)
 id 1wqZbZ-0003Q7-D7
 for qemu-rust@nongnu.org; Sun, 02 Aug 2026 13:04:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38e347638adso3074045a91.0
 for <qemu-rust@nongnu.org>; Sun, 02 Aug 2026 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785690243; x=1786295043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fKCb8NWcys/ZommzNZRAuYmhYCGnhBIR6CxzCeKWRKE=;
 b=Ikwk/bTO9prv1xOQggGr+SJn4NB5+7UlR0vfAYv9JuI6PQIvbNVt4ELCyIyTRxciLk
 kkyxI/OkhgZ5aTbb+RT0VzfpeJvFg/URRmeesDCuAFZqHRnW7RG3zmnp+cLID1XL1ryQ
 Lf36oV41S/B99wr/ILlk2ZNNFJ4lwvnluFYNI5ycKicB7jPiQaGizgXJ1c/T5JU/AXz4
 jds/c72gtzO0BDwSE84NC56oyybo41LqWI+gPraQcV0iBLBtxZQ1CjteSmFQgHhBPrOb
 WY5/ig3dbP1cVW7jV0NYRH2arO5eIvGCYWQtHRevh6DRJkkYrXf+d+Hnxg5itpWmEH/0
 gkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785690243; x=1786295043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fKCb8NWcys/ZommzNZRAuYmhYCGnhBIR6CxzCeKWRKE=;
 b=SMbSyue69c4lJX2DVU0ftXMFkZz/OpVSAUcHeZ3yFjFeuf/046i6Q5KTK2gAAgS2xx
 GyBdMIIAwFAuxhBmYVXqTFWrFYExW0c0GgGskN/qRDVh490MoVDTegOplZvPj0e8hXUE
 gOtfOvGBBd3oSVQmj04fv0WBImgCHx8W5w+9mbolxN1XrL7O4bZuUrOEx+RyRW0+TixW
 A1gT6xda4gm83UpawH3/pdFTN+8dJtcuf+pT9MyP0Ldm/XeBCjjrlyBOCYliscyYRfip
 /MS/69ihjBoojKJIvYCzde23gGboh1ylWKywu3bFSBOmEBGXgMf+c21REcBsxjcMB+v6
 Rrkw==
X-Gm-Message-State: AOJu0YxdKPZ+6Kgdhb6lXFEEHq0iquTlkyqRnDwbozBbryQOQ1TOQZ9R
 FzDR84VgnLlw8e0yvC8xJH8lmyT0vhXXD5B1ZE6H8IUsZTEsAxx/LcGa
X-Gm-Gg: AR+sD111lDq+omKRGkZVqx6Lx+GW55PJqDSXXZxlyfQh8XQ1MStGS0XscQBMqfoBTVM
 Ei6ZI7fh0LmHSVoNVoFzwWgaGZr45nPIrSeuITVklDYNHwLn4D0B5AyUBffpQwntCNwOE7CCgW7
 UjPB3ucoZ+EQBWYGw3mUqmvUvWGY6uLVS9VcaN7JOqeaKs1uCn4HfFZsvKpZ4ORHtYt3qiiWMSK
 bpc7spVArarKqw8+XVggnXl+Cb4Jk9Hdz7Hh231Nu9oaubjx8BCkJwNEZyRAqcl1FzoJJaDhW+g
 kMm++OL3lsYRdjCvRCu2bKqJPJUL5gA7WdqxLWCVJ/c2oU9/ICs5McyIe8O2Rjkm6PXdzko/hd0
 CvGf15lqPf7QUCt6fx2OJ+0yUbRnAT5/5lV7CiR3I6B8Z5XN53mxUk9NRy6S2WeXKDkRLGTMsWf
 YjtWWYLLnTTKXcLkxSGvQpCcYI4lWOfJd2BCqiGH6kIesNO1j2V/JPdhyyOFuW1g==
X-Received: by 2002:a17:90b:1d04:b0:38d:e5d0:9bd with SMTP id
 98e67ed59e1d1-38fbc50f6ccmr7593854a91.26.1785690243503; 
 Sun, 02 Aug 2026 10:04:03 -0700 (PDT)
Received: from phi.nguyendp ([116.86.160.247])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13fab132cc4sm22982126c88.2.2026.08.02.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 10:04:03 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Nguyen Dinh Phi <phind.uet@gmail.com>
Subject: [PATCH 0/2] rust/bits: Fix minor bugs in bits crate
Date: Mon,  3 Aug 2026 01:03:43 +0800
Message-ID: <20260802170346.3493821-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=phind.uet@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Aug 2026 13:18:49 -0400
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

These patches fix two minor bugs in bits crate

Nguyen Dinh Phi (2):
  rust/bits: Align SubAssign behavior with Sub
  rust/bits: Use checked_ilog2() in Binary::format to avoid panic

 rust/bits/src/lib.rs | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

-- 
2.53.0


