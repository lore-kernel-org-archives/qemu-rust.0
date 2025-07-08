Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1B7C83F09
	for <qemu-rust@archiver.kernel.org>; Tue,  8 Jul 2025 20:45:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZFA5-0001mK-9U; Tue, 08 Jul 2025 16:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZDbK-0001B0-3n
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 15:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZDbD-0003Tf-9h
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 15:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752001401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Gdx1q+rrU6158H3BQPcBGGZDWmI3FjZATkH97HRwvxgGw3+HGzDeCKKmIKTQ6huMIA1jzR
 s324KYAoLeVneXHEyFR3+R96fQQQL2agqbY7T659moVWM1Os8mhM+cNfUYxhQ1MF8TE8D/
 DoON0XJXz4mqozbLVbfH9juhGNigJ0k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-SghTS6n7OnaIuxqXvx4PVQ-1; Tue, 08 Jul 2025 04:35:06 -0400
X-MC-Unique: SghTS6n7OnaIuxqXvx4PVQ-1
X-Mimecast-MFC-AGG-ID: SghTS6n7OnaIuxqXvx4PVQ_1751963706
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4538a2f4212so21298275e9.2
 for <qemu-rust@nongnu.org>; Tue, 08 Jul 2025 01:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751963705; x=1752568505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=kbLo8AJ1b6Ch/YUZ90T2viiPvAuBhQ6NM6LgNsuVT/PGQ5GYrciGC3Ot8tT0WuiQaR
 bInagB7U0jj+AsnayaHa082aGPrL/AoyWHFXdqjuh1+wFh/IBGzUOO4VMKZNogAd0NXh
 GJnsqMX/tIfEBJU57pQyI3V0cy3zjI2ZaIsQRjD3gtlHE97gYaT9l9PbxSnKUGPyruG8
 GuV2+l4d1/Dn/MYIv/PCHA/V0x/kMWihADjUgr84xmE0JDFXi+YIFKjljWXHViye1K09
 96PLdG3jycrr8tST89bB0NKhYlJOqMIGj7UThPo1e6NLJaLdVa2LNaV8s01McKL3qsXb
 eMXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJWM2e6Wp0PWgGdhEjm14wgsr9h8Y/v3bHGmclYi4FQki6V/Ho4AehMjOsNLLT5jl6nhVeSMcHu+c=@nongnu.org
X-Gm-Message-State: AOJu0YxVtqRSq9UrjtW5fHfv8XqmdfnfrylmUftGMkMkm2rQx7ymZPCN
 HYYPzTg4+orvGze3hwcReuxprh3Kjde/v9YUP8JnZz15irFdLxgexFj1sWe4QqzTevtguivvFpM
 EXBltFjQchshFxXwPfCp6NlvktwtlN89Bqm4FfRbTeiB089cEtERSyLBl7+Q/aMU=
X-Gm-Gg: ASbGncsMyEu1xCMD/pZisny5+BHeYuVJQgZ0HqmlDxEqFt66TqbWaca/kCs5oGkC/F6
 k8UdO5ieKicFjd0WVdgzAJsKObgkflUy/qlcMUzd2dtMeM+HoFr56X3bb3yJrmPKv1q0evq79Qr
 FffnKRrvj5rdfSgtetKCLTiyxPGJl+IBqDEhpzBcBQp//PtvgcqhLk7UXoS7wM14zXajdZdAzAR
 Wn47GH+jL+8q35WWgUuKXQvMv0BsArpguMi3e8p6GMn6yPvg2Be5+tKR8slNpeDASc3H6dzSlk0
 XGtTTj8JaYEvet9pMhYW9tRTxAU=
X-Received: by 2002:a05:600c:8411:b0:450:cabd:160 with SMTP id
 5b1f17b1804b1-454cd4b49c8mr20051805e9.3.1751963705174; 
 Tue, 08 Jul 2025 01:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuq228yys8KKAslTF+KBC8WlfLDQa0iRUsy2Y/shqoZ1rnYNPHPQNK3PwP453nsM6GYXe3lg==
X-Received: by 2002:a05:600c:8411:b0:450:cabd:160 with SMTP id
 5b1f17b1804b1-454cd4b49c8mr20051445e9.3.1751963704719; 
 Tue, 08 Jul 2025 01:35:04 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.202.169])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd39cdcdsm15265955e9.13.2025.07.08.01.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 01:35:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH] rust/bindings: allow unnecessary_transmutes (1.88)
Date: Tue,  8 Jul 2025 10:26:06 +0200
Message-ID: <20250708082606.49710-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-rust._5Fbindings._5Fallow._5Funnecessary._5Ftransmutes-v1-1-692ca210d331@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fFy4stIAxV3u-X_pss07DIFNneL4xnMoPFCy7dYDkg0_1751963706
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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


