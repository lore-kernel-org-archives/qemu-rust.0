Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2470606A31E
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Nov 2026 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gsnjeyJt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xWJSm-0001sJ-D3; Wed, 25 Nov 2026 15:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWJSl-0001rz-Ei
 for qemu-rust@nongnu.org; Wed, 25 Nov 2026 15:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWJSj-0008Uq-Hg
 for qemu-rust@nongnu.org; Wed, 25 Nov 2026 15:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795637968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izEtoT+OZdkDPh5u31/3qnEoz7/vLRDgp5RQGjBrFcg=;
 b=gsnjeyJtWkkzSlCzbGcJKJtf0ssp2kNoLezZpEFwp3thbMwIQ9/urnY2jYt4AOZ8SO3RNP
 RN6ZcA1BR3/t38UIb7MQQuz+JejZQy8QuK4NRQVZMlD/ZBkHUovqgdpZJtdRyIyrjF0gwA
 7+Tc/xT8syCw3gRYrdTMqlfb2/Rqou4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-gi3yp-xEPYmaFKgkOv67oA-1; Wed, 25 Nov 2026 20:19:24 +0000
X-MC-Unique: gi3yp-xEPYmaFKgkOv67oA-1
X-Mimecast-MFC-AGG-ID: gi3yp-xEPYmaFKgkOv67oA_1795637964
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9213237a52eso105051446d6.1
 for <qemu-rust@nongnu.org>; Wed, 25 Nov 2026 12:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795637964; x=1796242764;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=izEtoT+OZdkDPh5u31/3qnEoz7/vLRDgp5RQGjBrFcg=;
 b=tjEN/9KrOrA+B7g690aojZiBsNbIqf1Q7unQHerHogXopFHcMG4ZLYkP1w8a35vGOV
 J69WZUBbCY7Z6h53dq2a9x2U/t2KoK1fad+nGxZRKa+CNPXXQ9V/KMhOp3IgV5mEfzE0
 HklfUGRltJVrDjIUf3cKXlSQbn+1+GcxiB8/1gtA7ClbZu1J3DtLKf+WJv4RO4ZPdeOW
 he27X4mopZVfWPSmpuhDOqduU89j6/AE5Df/jm786SseBcu4J7m+s5vQNu6WHTz0Ll6+
 lbJ5B99MxHHwo1K6ZfGe4gdY2aaCjmQMhRTG6t8VAtHjFI0dPslplDxnEQiEHiYK4cp7
 liKg==
X-Forwarded-Encrypted: i=1;
 AL+hErFkAOKrPgdPwCjNl2jqvtLKAuInX6v9vUPipezCdUpVg+tVNZsdPghME3mKB38lqSTK3wrYCgBDGkE=@nongnu.org
X-Gm-Message-State: APuU4Z9KLj/o1haOBuI72qVoJXhU3WnXiFNYqRhaK9+u23jroe4i9oCG
 fFXUaG/cgx+a2XAqMyemMo+u0xuSa6nMFci0kOsQYI1YmrKg2+jc0uSgteFvMQdeBtpBYLX67Sl
 FEGpFbczWeNYvqn2r9M+3KEHdakuCNKT4IlyoR01hJHB1nqlHtb8A9KY=
X-Gm-Gg: AZFdTZdZNTAyfFB5Wl0KIn2WCWNKTc3WOEs+3YbvnBPQHPhjkUUUaaSlWjYUFO/R9Lh
 7TWLEE+DqiBcLK+i7Bjg1USWDqRApUDY7N6Ih5d2Qdto6mW/Pxpi+ZBsxr5brq8zmB2D4iDH3s8
 7EudTo/Cylcyq8WRoKXuu+yZkzTqEL/iwhwiydQlG++K+brRD683LtzSOCyqV9WckajhIEDPJwq
 Aub+xHtZZTmeCz3dt3C+ijje8u9webRgZ9YEzzqGGHDHGGiuMBw7uhk92fAVK7FVmbgATv3aI1o
 haAUETB5GGTnVfn3NcIlHslQN2LCoj/XqvC/74nBXlN5Z1JbYpYuO9DRNn+ZmAmCiwzxsOHTeRy
 bwyNTE4UFLMFKS5fqM+uBfm6as3MhRAQpVeNpWcKogU3K
X-Received: by 2002:ad4:5cc7:0:b0:921:e08:1d9d with SMTP id
 6a1803df08f44-92134b93acbmr370597726d6.49.1795637963983; 
 Wed, 25 Nov 2026 12:19:23 -0800 (PST)
X-Received: by 2002:ad4:5cc7:0:b0:921:e08:1d9d with SMTP id
 6a1803df08f44-92134b93acbmr370597186d6.49.1795637963319; 
 Wed, 25 Nov 2026 12:19:23 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134796329sm168896296d6.2.2026.11.25.12.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 12:19:22 -0800 (PST)
Date: Wed, 25 Nov 2026 15:19:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH 0/3] rust/migration: Remove vmstate_validate!() and
 VMS_MUST_EXIST
Message-ID: <awdCybZxgVqT0VsE@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20261124095814.437738-1-zhao1.liu@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261124095814.437738-1-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VsvBnKjp2uvTxrj9UufcAtQ4WXfu7c_7uKLgjWotvq4_1795637964
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 05:58:11PM +0800, Zhao Liu wrote:
> Hi,
> 
> This simple series is based on Peter Xu's series [*] and mainly refines
> patch 5 — removing `vmstate_validate!()` from Rust HPET (while
> maintaining consistency logic with C HPET as much as possible).
> 
> I originally planned to use a single patch, but breaking it up this way
> makes it easier to review. I suppose these three small patches could
> also replace Peter's patch 5 :-).
> 
> There is also some cleanup work left (e.g., support post_load_errp() in
> Rust); I will address this in some separate patch later (without
> blocking the current effort to remove `vmstate_validate!()`).
> 
> [*]: https://lore.kernel.org/qemu-devel/20261120124923.1656220-6-peterx@redhat.com/

I'll carry this series too while reposting mine just to make it complete;
feel free to repost / address comments concurrently from other Rust
developers, we'll figure out how it lands.

Thanks again for sending!

-- 
Peter Xu


