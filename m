Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBCCCD18A
	for <qemu-rust@archiver.kernel.org>; Thu,  9 Oct 2025 21:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v6xvz-0004xt-LN; Thu, 09 Oct 2025 17:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6xvy-0004xZ-2C
 for qemu-rust@nongnu.org; Thu, 09 Oct 2025 17:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6xvp-0004jF-LF
 for qemu-rust@nongnu.org; Thu, 09 Oct 2025 17:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760044332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8vFaQq5bO3QdHThnOZntVJqWF1rUBmNHmqnUMiGjqLQ=;
 b=iSnh07WxMZIvTZmu7NxkqkSqAYJlPEefgrFMa25JEZmny3VG5Fa3B0PkQhzqTtye8wBh1u
 AA+QbbYawWLlDmCWN5DLnh4nVtk8RbKVQsvnzSh2MEfAHHW8tOdA559Tv6Y90uXKCs37Yy
 Bv3xQh+3Vzg5x12q26X0zPr2tz/Rvmg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-FcHNzCPXOPmCk7QgV9PrSg-1; Thu, 09 Oct 2025 17:12:11 -0400
X-MC-Unique: FcHNzCPXOPmCk7QgV9PrSg-1
X-Mimecast-MFC-AGG-ID: FcHNzCPXOPmCk7QgV9PrSg_1760044330
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3efe4fcc9ccso1117846f8f.3
 for <qemu-rust@nongnu.org>; Thu, 09 Oct 2025 14:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760044330; x=1760649130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vFaQq5bO3QdHThnOZntVJqWF1rUBmNHmqnUMiGjqLQ=;
 b=nBO/J77107hOfRXJHSmpTla1K0mvC3yd5REkwd3tcUSuCistlkYnmmiPLPGsuQ39/a
 DUtsF+IuH/bIRDtYH1nY/uopIty5K2wbmxS4v210deIWv7rzJ/wRhLEHk44REC2o0ROW
 5NNTAhbuWHdOZLAyAYZcEC1mDdhNO6QVIIVWikQmsFqtNOpishF1xKhLVWAZx8K8zjmD
 qC5CeYFhNdKaes5aDV9xP1CpNKSyzCatW441SkwIKMIz7DaDb31h2B8/0Jdv3ux3V8fL
 Pl+lihnlAmAdVq1YLpl42Fr5+5nljHJ6MnR/FI56vJT+d05ijOTqip+VJa0428m/cmsR
 EapQ==
X-Gm-Message-State: AOJu0YwL5JbihN6eu2z4El5KdGMHkvBQ9hueVkjSq7ob0QiT5mNYjPUJ
 DQWoHn2DY97ZZ31uLbiienThNxqR/Kj5Yb4iV+dteW6pYJbFKtXg4LSfiQpeZ4zn/IGbMzoSuVL
 mQqNmMcODJc3R58Dfedeprwbvkj9hKBeZQCrVZLeHcPVcq4n52FdsnnA=
X-Gm-Gg: ASbGnctLP5OCAli6TAWNvtPHhi7CM5BbqX2i/NMZrfnU2tGmYZP72qbRPvWBgDOlqmq
 GgqIZNFvJgKIIxdqrKWeYV2HGbwb6qXRyNUVxM8+0n61aqO5J/nRbg9/r65ixMKzpQxjBOMCnJW
 joYWXqk2J27o5e/D6ZL3Jr/fMTf2Ahsp2lVI0aPKS53p1kiOwlScEeKWSjm31KhkuS8/L4m6rUF
 lNg/pQB2LIIZ0m7TC05Q9xGEW2Lttavdpi4ySLTu2TdJ3Rk2HqK8X2cocOYu8ZSnaEbNC2fOmWf
 /E5OX/OodVYLViNtyM3d34F1vJGUyr0OxlkiUlhOVwsVnL7681zfyVQDuNY35meWgSSshXDLuzi
 686AzdjYCVqSu9c8z9rYgbw9xZeUyJ66b5HEAHOpF51UNCIQatg==
X-Received: by 2002:a5d:5f94:0:b0:40d:86d8:a180 with SMTP id
 ffacd0b85a97d-4266e7bf005mr6316330f8f.20.1760044329764; 
 Thu, 09 Oct 2025 14:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2YVuE57DYvf40C9YpShEV1rkDBw4MFIGfK0W8vvfGW4EFVS81w3dIV2RmFGi3s5XwGUPDBQ==
X-Received: by 2002:a5d:5f94:0:b0:40d:86d8:a180 with SMTP id
 ffacd0b85a97d-4266e7bf005mr6316325f8f.20.1760044329407; 
 Thu, 09 Oct 2025 14:12:09 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d3b9sm871873f8f.11.2025.10.09.14.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 14:12:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] rust: temporarily disable double_parens check
Date: Thu,  9 Oct 2025 23:12:08 +0200
Message-ID: <20251009211208.643222-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TX1lkicBg886lLIZ4yjNXg3LoxHUID21PpJbB49mwD0_1760044330
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It is showing in the output of the bits! macro and not easy to fix there
(at least not without making the macro more complex).  Disable it for
now.

Link: https://github.com/rust-lang/rust-clippy/issues/15852
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 783e626802c..4f98b2c03d3 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -109,6 +109,9 @@ used_underscore_binding = "deny"
 # nice to have, but cannot be enabled yet
 #wildcard_imports = "deny"   # still have many bindings::* imports
 
+# https://github.com/rust-lang/rust-clippy/issues/15852
+double_parens = "allow"
+
 # these may have false positives
 #option_if_let_else = "deny"
 cognitive_complexity = "deny"
-- 
2.51.0


