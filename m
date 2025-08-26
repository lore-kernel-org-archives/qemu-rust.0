Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1764CA0EFA
	for <qemu-rust@archiver.kernel.org>; Tue, 26 Aug 2025 15:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uqvga-00063d-7L; Tue, 26 Aug 2025 11:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqvgZ-000632-Ky
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 11:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqvgN-0000Pk-IZ
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 11:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756222436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QogLuuSQa1vN2PO5bJXOhb2Cy6/qAbMq9w2GP94I5U=;
 b=itkgAZSj5glcTb20svielDnJzctqgTt/jXpFprFKmtz0uzmq8HFPoNXdGx3emvJyXtMa/j
 XE9v+gSo/MztWYGDS3Tp/axFkFzO3BdOPch2P5ewyMb9yib/aNJRTe9xF3r9lf8U9YloTJ
 9n/PvZyAl1DpuCn22W624ZmG+nboFdY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-2qxtXRcEN-ePRCXmTUNvWg-1; Tue, 26 Aug 2025 11:33:54 -0400
X-MC-Unique: 2qxtXRcEN-ePRCXmTUNvWg-1
X-Mimecast-MFC-AGG-ID: 2qxtXRcEN-ePRCXmTUNvWg_1756222433
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3c7aa4cf187so1591443f8f.1
 for <qemu-rust@nongnu.org>; Tue, 26 Aug 2025 08:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756222433; x=1756827233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QogLuuSQa1vN2PO5bJXOhb2Cy6/qAbMq9w2GP94I5U=;
 b=LHRSXdFyZQLyFOfT326FE88syZuPDNcBTBdFIp8M9wnWcLiUq7dCOr4ysPpLF7texw
 stkWEqE7lrqzKUV+QWsDfgzxD/4GSPyGM5wHVy6e+xnnli1XrLdKyAaSbTrpaQlFevKA
 MrCanM/5b0Xpc+uSyP7wmq3ylXCjfur7OxXOMhkIFL7Lr8WcpUZaN0znlRUPRoI7uXy7
 NsRR/4s03dLDJzUUhCtH9MNiVz2J0unFkDsLYwXAOerh9svCc9LtFHoHn7x+pe+L+kyP
 k6h9IwYO2BV09OuKZy9WEjqTuM93IZlXK4a2NKCrRz8VANKDBIvn/iPvbu7PaOfGOjSf
 0fuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA/yMHQi1fGiSa33ffhFC/oc+NiIDrcXjRZGpJrlKvwIop21bciqawTdEoqXNNzL9lrAs663DJxvI=@nongnu.org
X-Gm-Message-State: AOJu0YxpOosu/g6xKfFUBfZgPORKiVDtwiCpQL0pQmQ3rOUWYxinvS2k
 FVGYeGBasKQZPCly3BA42CT8qlQ74Ja8tekk2nxRiV7pMGQ4ajfd2Aec18ho1WlBb4rq3kNRSiH
 QzvJo7lP07yyFODqr1IdDID3fRWaZDlimwvIf+bz+Lv9RrciA9G9DjF6MkzdTENBXtOVj7/sZhb
 28p5rcgPTbNrxtgeJ1KXg2n7Tl+Qpzaw==
X-Gm-Gg: ASbGncuanu+LjODBciRylDpRLq34XytGCp6eBgZOcgn7n47+2xKfeCttG4l6N+vL8gP
 PC2LU5lM3odXs1ospLM92wCnZrWYAMGapvohf/W63WRe5EFemeg0K/9Qo9u68T+Iyopwht2Rhx/
 AZH9k81QT1t7p2523/RacX1wRwhpVVv4d6YDW17Mol20IFHgjL1qtnHTOuh3GzUZm47u2V/pGpd
 aCpI1IKmqbPV0cQDpLp3cES
X-Received: by 2002:a05:6000:381:b0:3c4:2a56:14db with SMTP id
 ffacd0b85a97d-3c5dd8aa758mr13384428f8f.41.1756222432985; 
 Tue, 26 Aug 2025 08:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5oceQKcElAKiE4KlwJ53mCXnAfiQSCparQYyLHtI7rLnwCShrBr2IKkvQcvqcG0CR3U+3wPI5MLuWBBCdcjE=
X-Received: by 2002:a05:6000:381:b0:3c4:2a56:14db with SMTP id
 ffacd0b85a97d-3c5dd8aa758mr13384401f8f.41.1756222432526; Tue, 26 Aug 2025
 08:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250826140449.4190022-1-marcandre.lureau@redhat.com>
 <e58ea933-f941-44d8-8477-c8298663cc24@redhat.com>
 <CAAjaMXYwEwpaybjEiA6tBCartTrzoAqsKNzHSfrs4f2wJx-wjA@mail.gmail.com>
In-Reply-To: <CAAjaMXYwEwpaybjEiA6tBCartTrzoAqsKNzHSfrs4f2wJx-wjA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 26 Aug 2025 17:33:40 +0200
X-Gm-Features: Ac12FXxEcrKLfJpwPU-c6QgaD0tDol8ORwo5O4X-0LcYDSg-y6saxDFaOyeerXo
Message-ID: <CABgObfYkiSWmztjfH0HdOhMpF+NRDr-F0NjhqqaDcbYoWbzRFQ@mail.gmail.com>
Subject: Re: [RFC 00/18] rust: split qemu-api
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-rust@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lEBY99cA24x4CC9FQkRYJm36IOxk2moAlFkNmaDyxC4_1756222433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Aug 26, 2025 at 4:56=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> I kind of agree with this sentiment. What this series basically does
> is unwrapping most modules to standalone crates. Semantically, they
> make sense to be their own crates just like they made sense being
> their own modules before). But I'm not sure what developer benefit
> this brings,

The benefit (or rather, the problem that this solves) is that not all
targets in the QEMU build use all the C libraries; in particular,
tools like qemu-img do not include hw/.  Therefore, when Kevin was
writing his Rust block layer experiments, he had to build a separate
version of qemu_api that left out anything that could cause a linking
failure for qemu-img and friends[1].

Since we already have a well-proven module split in the form of
variables defined with declare_dependency(), using it for Rust as well
makes the most sense.  I can't exclude that in the future we might
split even more (i2c, pci, etc.) but for now the split that Marc-Andr=C3=A9
used with a single "system" crate is good enough.

Paolo

[1] https://lore.kernel.org/qemu-devel/20250218182019.111467-2-kwolf@redhat=
.com/


