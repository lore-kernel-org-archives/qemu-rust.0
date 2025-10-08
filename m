Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B3ECCA470
	for <qemu-rust@archiver.kernel.org>; Wed,  8 Oct 2025 06:34:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v6Nkl-0004G7-AH; Wed, 08 Oct 2025 02:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6Nkj-0004Fj-43
 for qemu-rust@nongnu.org; Wed, 08 Oct 2025 02:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6Nkg-0004Aj-Hu
 for qemu-rust@nongnu.org; Wed, 08 Oct 2025 02:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759905256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=A37JW34eAIXOjuWe0iBQu9AYsnSDOET9BtFDZv10+9qjDPHSdgV1SsFouOCXIpb65ca6Dg
 25ZN/vKLF+hWPd+3IwJcTEsV5rBjBRAhvV44WDJCqXsS433c86rrHun79EbocsnbDvFS6F
 qRQgkcmq8vSNxTnortsNZYoGIhngNkE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-uBpQw2RHMJqW33xibvJMVw-1; Wed, 08 Oct 2025 02:34:15 -0400
X-MC-Unique: uBpQw2RHMJqW33xibvJMVw-1
X-Mimecast-MFC-AGG-ID: uBpQw2RHMJqW33xibvJMVw_1759905254
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-6394afe514eso5675110a12.1
 for <qemu-rust@nongnu.org>; Tue, 07 Oct 2025 23:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759905254; x=1760510054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=rVlPUQUbBg/WqwnjO8msPdwOL6eEzWNX555eZurbFaI9Z3khaa+8orhjE6n/bMuNUY
 7GNbHOYhwfdk+sLjEvOtCzSrq3Q0lgidT6AjLUNEFg/k2MB5uR7a6OrcKpm9yDVCWPN5
 fl5Lsrp6IPdwkJR61WqHNt26MSELlBjik5WBDBvhYPKgv8Z3n7GD1fZg2EZ1RPn+PFzK
 rm2s4m4pliNsNvkicrqCJy9C+vSIh17o1A49/jBcGyEx/Gocncr1qTT+hLYeY3vrx7i+
 zepB5D05kNwoqTbiM2QaCSdQxZ5Jp16OdL+PUI9YhrZQ2HcfY+IqjmqahVSy26sT1Ko6
 5d4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfo3OGJ4fd7Po5CH312KtcAc0v0SwLwV6sq0yqLjLW3O6ccPaFCXsJ0Nej4ybaYEboMOfD/7FswO0=@nongnu.org
X-Gm-Message-State: AOJu0YwiZpifTm+UV9b0Q3pI3mXZqbU+dOP0h+pCrX0GqmORTRTyvAC9
 NbGir1JIiCvXXPu1y8yrWzFDozNqaNo22BtuQxwuxNOUTwLTRpdGMVFwyIi/MND2AFtWOlqOvI5
 ZlfcwmDy157Ss8yThx3XLaQ6/Wnu0+psZbNzyQQEKtSqjLtU2N9HcY+4=
X-Gm-Gg: ASbGnctWpiJoa+lZhlyVGS2WQ4/1Kq4PbF06clwtYgyMDdUkihEiDRe0nM3VMgsjV1C
 838nDNGrnbhyg2nbfF0wllw633Ed2KOqjyaqhffLH7zFOMHxyE2S7EeYdGFQQvIYiuFj9ZeVD+K
 c6+5dkbaKRENJQxr7fquDbkRqY4BVZQdojKhIo9K4/6S5UtmcaxUig5Qw1l1FcnRgOG4NUd4MOh
 kl5pBIxYnnZ2jAPm5tIHB74zDDW2XKbqaoxXqT+sr8GN1gzI5D37whnbmb/0JBkNlo6NMrN9vTm
 MUi6S+9cUctvD3TIfGw3l+Fu549x9hi+bzCuxFibihwpHaTr0F9qEV8heCaVgaUuhVfjL5oIIBk
 Civ1zafPNoGEy1MWr/xMilesu5KhJFzXUth7bPtR7MbNYHerL
X-Received: by 2002:aa7:d0d4:0:b0:61c:8efa:9c24 with SMTP id
 4fb4d7f45d1cf-639d5c6fdf6mr1416817a12.37.1759905253955; 
 Tue, 07 Oct 2025 23:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXXjSS1c16EIUbU3HLAo0b49V712Sh66tooPOS+NEFjHedIHqFkdXGxEVh/xeeSEFvTOc+xQ==
X-Received: by 2002:aa7:d0d4:0:b0:61c:8efa:9c24 with SMTP id
 4fb4d7f45d1cf-639d5c6fdf6mr1416803a12.37.1759905253571; 
 Tue, 07 Oct 2025 23:34:13 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.36.217])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788110224sm13860261a12.39.2025.10.07.23.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 23:34:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH] rust: fix path to rust_root_crate.sh
Date: Wed,  8 Oct 2025 08:34:08 +0200
Message-ID: <20251008063408.376247-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007194427.118871-1-stefanha@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M9muzTNYTqrucAKkV1geZkJiNcvpO3UQa5voULHgxJ0_1759905254
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Queued, thanks.

Paolo


