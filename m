Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC99CCFA1A
	for <qemu-rust@archiver.kernel.org>; Tue, 11 Nov 2025 08:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vIjf2-0007Sr-H7; Tue, 11 Nov 2025 03:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vIjev-0007OW-0v
 for qemu-rust@nongnu.org; Tue, 11 Nov 2025 03:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vIjet-0005AN-4h
 for qemu-rust@nongnu.org; Tue, 11 Nov 2025 03:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762849400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=VMjEvhVl4UECRNXBGAidzn9yhSJwHsVcmNbbbZLMtTSJJjjTo6MiypKoHzFnqcb1ZdY5W0
 CqHAKgdRsCbnrXucMHGD7ocLNcba6Irs4raaxdvavDlQtNBwNA/vJ5hJ9hENVo/81+X380
 RPyuAIoKpfN/Wg+7OJEZZB6Jfkj8I5M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-cehWBbNPNmmdempbpgBXxQ-1; Tue, 11 Nov 2025 03:23:19 -0500
X-MC-Unique: cehWBbNPNmmdempbpgBXxQ-1
X-Mimecast-MFC-AGG-ID: cehWBbNPNmmdempbpgBXxQ_1762849398
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4775d110fabso30034355e9.1
 for <qemu-rust@nongnu.org>; Tue, 11 Nov 2025 00:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762849398; x=1763454198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OZZZWOg7nAvEKVlmP/0Ct6B8m0B5DUrxEt1erVxluUAIaUH3vQD2CjMTIDEBzJsEYC
 Z1358iUXtjUOrsNq7/CoHjxOStRtqBY3r23O5k44/GgTSq7rh43wjQNzpZ2xNi9SWS8Y
 YJweX+Xefw+vd3a+reFRFdGkrKX/FFN4HInth8lvusj/Q9BceSofvgXk8oArS93hiojc
 9KcSQ+KRhif3+yrLX+TSNOVqZFfDQOkDRBbGkPXZwqFA45eztTh7m8cBMOFZl8odHNhf
 cNEDeCU8XLfLmPahHj6w/qZMyjGIDnqsHONMVk2EsKWVa5lwUHj50rW9IOjhFEC0GXGD
 4Wvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOfo0QyyGhXBsfgEHlRLdfcEkwEHfLR7b7erS5RtR9CZnXow0zvkI0nAjKa5Nb98tlVEOSBSOwGYQ=@nongnu.org
X-Gm-Message-State: AOJu0YxxoUycWWvr4rzqbwiBWeIuBcLI9YJiCp3i1G23JcEXFt287SJF
 b2suG7HYXTW5tlvGhbD0oqLba4R6G7tHqOp1IZjFTIVs/8dwgP4nE36kUVSra1EqQ06Y4vZyGh9
 P3NTfYKK0ctb6UIUkIF8S9VguW8UZ5KtCOGzFl/oNvPEa9uXUYfDQM18=
X-Gm-Gg: ASbGncsE1MzbOsibF2RrhDr0u7ANSRh2rQ3ui2/I0L7wVzLX9GE56pesKV3acNKK9qQ
 8P5wsfMbPu1F147PEnjHEpCM2Eg+7xbR5Wx0h3voaNqRKYgzbEsoI9Vnx3ViFQJqXCfH7/87lY+
 e2JNCxMjFQu4+OJI2nAheDXQ6oR6BByb3IP+en5+PL+RM8fiv5+jsGhK5xTnJXpSdetG5hi8q5/
 5KkWpOF5aq/CmjHDucV/Zp2o61x4x4DMkGXYkJJk6rCHQTnrWyE1KZHaqF4RgDAdQaGP4q1C+/G
 CHhtlCy7q9LmJ/7tcTqxP+yPSPng+ksQGjRKbou2hBUiOu6NhPyZa+aJPR/cRxE1Q+GciVD9YZt
 kMTnc8C4PSqxuGtH6n1q8MkbhPu2oqx5vb6rZrXYet9tE0p9iAhfWQw0oNhSO+Zk4qhYleAbfpP
 /t0Elb9w==
X-Received: by 2002:a05:600c:2297:b0:46e:4a30:2b0f with SMTP id
 5b1f17b1804b1-47773465fc0mr74951805e9.29.1762849398112; 
 Tue, 11 Nov 2025 00:23:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaPHyFWp36Iv7gT3TVS0tlJIb5FjOTceTB1p5zykIFjyiPFpzDthJFRBzTAeXIsf8xVn76GQ==
X-Received: by 2002:a05:600c:2297:b0:46e:4a30:2b0f with SMTP id
 5b1f17b1804b1-47773465fc0mr74951635e9.29.1762849397718; 
 Tue, 11 Nov 2025 00:23:17 -0800 (PST)
Received: from [192.168.10.48] ([176.206.111.214])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477789f3f0esm138597975e9.6.2025.11.11.00.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 00:23:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: Re: [PATCH 0/2] rust/hpet: add trace events
Date: Tue, 11 Nov 2025 09:23:14 +0100
Message-ID: <20251111082314.24152-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106215606.36598-1-stefanha@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FhMLZY4nQdMgVNPIygAkISQ4F5dwUPj-AgMfpLixGoQ_1762849398
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

Queued, thanks.

Paolo


