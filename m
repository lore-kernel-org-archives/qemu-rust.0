Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BCCCF9F8
	for <qemu-rust@archiver.kernel.org>; Fri, 31 Oct 2025 15:26:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vEr0r-00012p-Br; Fri, 31 Oct 2025 11:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr0p-00010r-02
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr0g-0000nR-Dx
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761924346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uj2/fxHWeywKmqC1Hm2LMSVtzUGKw7GtsYSGWCXlH34=;
 b=Kb1yrIFXDIhUn7kTxMm9QbKs5uqtff6dfdV7awBmg6HoRDHIAj4kM0u+vMXGpiiqZ2zERo
 kXe4VeYEj7J2QVZnHXT9KK4+nBscpueTe80esR0IV3F7AQxtoNNHXZ+hXeiMpTsTThmuAK
 OjWPzsPbc1vvrGILpE5r+F4FoNP8A7k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-DhkVPLuoP0-gf7XdiA3L6Q-1; Fri, 31 Oct 2025 11:25:44 -0400
X-MC-Unique: DhkVPLuoP0-gf7XdiA3L6Q-1
X-Mimecast-MFC-AGG-ID: DhkVPLuoP0-gf7XdiA3L6Q_1761924343
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-476b8c02445so20452445e9.1
 for <qemu-rust@nongnu.org>; Fri, 31 Oct 2025 08:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761924343; x=1762529143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uj2/fxHWeywKmqC1Hm2LMSVtzUGKw7GtsYSGWCXlH34=;
 b=IndxKdKhplvPga1NyaEOquW/6TvIPc0uiT8yi6nH9eH3FX5kokyc0CSZbVI0HvTk4a
 P4sAoMGJ9emyUdOcEgR8DSm9j4nN68U6QRC7jWeeKPpzyFjk/UfOUT17myA0k1gABc+T
 /vK6X3N9urTq5rMUzCIrtqoTRaDqe1+Uuo63VvsONT9cQyN+korpxFy31vlbpzyOlJJs
 ZJtiKQ/QSXX8Qmpy/hPBA8nUmHrRzF/XGIbTHztulkcPQmzp1B4nF3AY+QhIQFbw794j
 Kgm2Bx/+Se5swv877IsQRHBE/xupx20zsZYj8/Xx6ddtAc2Jh/g6h6rYSRjVDoo8SVZE
 K2LQ==
X-Gm-Message-State: AOJu0Ywy2FtrD3424B4/qYw5r4wQPUKFnFo32KLWipwRWk2mO/7RjLFl
 JWhekuZLc3U6tF/O8I6eeBYxoRKffdMIu0ZQkamWzgAVbgveeDQZJ64S1ExwUtpYs5JpYRo2KLc
 XzlJhngW3HP2q8mxdtwlASaWiQtfPbQ4ZaRLJg820oKz7rYi7KoQQc8Tl/VwxKBk=
X-Gm-Gg: ASbGncvXv9n01clGxXtM1tpyhuFf+RGPbngkeNVkWQhJVpg7GxTdzKly717cOtWOzwR
 4bbelVIE78gi2evEYDKSZSId5Nley6BLGuomlstIxK3ejUCekCvqgD2wVmpMUzezo2bO+7EU9iY
 XNMNvAgaQ14fDfY6czeP6g6HGsY9s4eixUCf97m82jo0LBrhybLdULnlWW0QbYeT+0JiEzwCfH6
 1RTSWL8CR8LfmZQtTGH7xgOp3b84YjPjGfIByDuDBVcGIAIMJzJFchVWLnzMZo+ZkuVM/eauWC4
 jtr4zSKRLF7rij0Zad/+8IYkVGiURWJQR85OFhm2GmrpaaXScz8Hr+4ljizFe8XLGhTBLfsPqNF
 GcaDVaZnqGsxj8O5oXfbvBWjF5aMqAiV+m9hzRhqC/c9ufQG6nCP8iQoqCctq3H2jBbOU7hKZ7c
 pCLZGL
X-Received: by 2002:a5d:64e7:0:b0:3e7:45c7:828e with SMTP id
 ffacd0b85a97d-429bd6a4bc8mr3703663f8f.33.1761924342890; 
 Fri, 31 Oct 2025 08:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGszhu8xvVmUXg56hTW6ajlY+QMIjTgUhutkZIzqxDTkpQi2rFzK5izEHH41Qv5LZJPfze+5w==
X-Received: by 2002:a5d:64e7:0:b0:3e7:45c7:828e with SMTP id
 ffacd0b85a97d-429bd6a4bc8mr3703640f8f.33.1761924342479; 
 Fri, 31 Oct 2025 08:25:42 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.110.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c48ee52sm2283185e9.2.2025.10.31.08.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 08:25:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/4] rust: improvements to errors
Date: Fri, 31 Oct 2025 16:25:35 +0100
Message-ID: <20251031152540.293293-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nx7j2sYTTfedMXYQNdM7igZvs6r_4GGBPTxJoO1_Nes_1761924343
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

The first three patches are extracted from the serde work; as to the
fourth, I was thinking about it for a while - it provides an extension
trait for Result that makes it easy to use &error_fatal.  The main
advantage is to make it clear how errors are handled.

Paolo

Paolo Bonzini (4):
  rust/util: add ensure macro
  rust/util: use anyhow's native chaining capabilities
  rust/util: replace Error::err_or_unit/err_or_else with
    Error::with_errp
  rust: pull error_fatal out of SysbusDeviceMethods::sysbus_realize

 rust/hw/char/pl011/src/device.rs |   4 +-
 rust/hw/core/src/sysbus.rs       |  13 +-
 rust/hw/timer/hpet/src/device.rs |  21 ++-
 rust/hw/timer/hpet/src/fw_cfg.rs |   7 +-
 rust/util/src/error.rs           | 272 ++++++++++++++++++-------------
 rust/util/src/lib.rs             |   2 +-
 6 files changed, 183 insertions(+), 136 deletions(-)

-- 
2.51.1


