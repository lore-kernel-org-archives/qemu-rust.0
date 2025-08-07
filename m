Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC67C87FCF
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:57:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk17Y-0005a6-76; Thu, 07 Aug 2025 09:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk17W-0005XO-TC
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk17T-0001D8-Gk
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754575042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=veE0YXU9ZdxW/BhZLiaGxGzPpaO9gN/is2WgVHdvubc=;
 b=e10SRB2NyHFLvBul33smI4Xv/6c1a5goxzPYnlPzTbd6J6geZcKFWTA3itoUWSMUE2Seo5
 rZYgnuG0tVauxfDsFLe7/IBeJ3h7Ufet4vw6ioNYiVDzyxaKB+EMI5IIU28L4i8B3wFPVy
 x5eObKZF3Of7tSA3ssnp/DemFAcsmmA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-Hhc8i2JSP5OKE0vam-WuLQ-1; Thu, 07 Aug 2025 09:57:21 -0400
X-MC-Unique: Hhc8i2JSP5OKE0vam-WuLQ-1
X-Mimecast-MFC-AGG-ID: Hhc8i2JSP5OKE0vam-WuLQ_1754575040
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b78b88ecfeso522134f8f.3
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754575040; x=1755179840;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=veE0YXU9ZdxW/BhZLiaGxGzPpaO9gN/is2WgVHdvubc=;
 b=PQW6+CyXhMDJj0uxywqtOSeGC27V42Qb4dM0bNWfKu2Zu1UySFBj2UaBeInZANX7yy
 27KocHIV2DUTdhuR/tsbc9afzGFL1YVd/eL5prZ7pnRyyi6CDLKdifaTOGNPYDhLbuKN
 DQMeF09d969yoCl8t3A/NLi8jVtgihFuYOq2xsXy6JmyXptaa+xv/5E51+xOXzb1BlfY
 DIzwJrMdFd8NZFnf//O1sdP175s0Fs79lU2JPL+492RzjZ6ksfQoImKeyuTLCG5Dkq9R
 LTh57x6mVWMO2bViSu5kmM1f680wbuh308UaCGeyetpFN8ORzGLQVlg1zZh/aTDrXrEi
 G+2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEmyPbMGGXcEz3SQyoRrPc0TXtIb3WuRlNHUCV6QJnxRH3iWZ8V0ZVNaj3yqW0NQXuhqSKYH9K/kg=@nongnu.org
X-Gm-Message-State: AOJu0YxJQ2IRs0DJOxJK7DgxOpBcJlhHi7W1pU6mCqOApqYGkq5oq5Hy
 xEqBscs8BjuzGizyd8ps2zYR+m9l/JokdzVH7LgrAMBRdBb8T7apDKQaUXWS7F08GACedEZVqx3
 y2sc2VuyrjaLyGCci/NCoVhRTI5OS4DhwEJ8fCa6saZ1wp+zgxVPAtbA=
X-Gm-Gg: ASbGnctCUwiiGjNClLIZ6WrDEeVVvNf0c1pMMDrEZuXNInmqi4hLi/8yfjPH6AkjP5n
 k0ucJVnI1qD0gK67fe8vlCJR/0S7j83QI3KqptJSd39Ii+ODD16zwtVS3Tm6u7HrlkQhOm8X85T
 aTORC3vouFVNVI+x1RIbusvBUt6aQa+VficebYF5kpwLEM/Yzo5Zrgu987KhnIdOwI29W7hJ0JF
 tcxSvwuScOv3OFT+rZeK5E9rd9Y3/E2v5EcwK5e6tPR0Uh69Zdf4lXJU4O4/TyX11SglTsJMQNe
 9QbFXouHpKTcfHbntq6L9VzaeebZ2PK+JffGPp0z35xe
X-Received: by 2002:adf:fac6:0:b0:3b8:ff39:486d with SMTP id
 ffacd0b85a97d-3b8ff394bb9mr931388f8f.8.1754575039876; 
 Thu, 07 Aug 2025 06:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXYwZoGNhakMxRJpYivC+7uq1cW0gVwDnE4VKL/NXOOs4ZMWf4zIuaDjvfzTtVOw3TIhYo9A==
X-Received: by 2002:adf:fac6:0:b0:3b8:ff39:486d with SMTP id
 ffacd0b85a97d-3b8ff394bb9mr931369f8f.8.1754575039368; 
 Thu, 07 Aug 2025 06:57:19 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.253.173])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-458bd5a0f9bsm127902595e9.0.2025.08.07.06.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:57:18 -0700 (PDT)
Message-ID: <beab841b-9c69-43d2-b996-879eee9e1120@redhat.com>
Date: Thu, 7 Aug 2025 15:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/26] memory: Make flatview_do_translate() return a pointer
 to MemoryRegionSection
To: Zhao Liu <zhao1.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-17-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250807123027.2910950-17-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oQzpu72jt3EQFQ9R3LbnwuAWhzPkWFnTnwqLN9unBvs_1754575040
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 8/7/25 14:30, Zhao Liu wrote:
> Rust side will use cell::Opaque<> to hide details of C structure, and
> this could help avoid the direct operation on C memory from Rust side.
> 
> Therefore, it's necessary to wrap a translation binding and make it only
> return the pointer to MemoryRegionSection, instead of the copy.
> 
> As the first step, make flatview_do_translate return a pointer to
> MemoryRegionSection, so that we can build a wrapper based on it.

Independent of Rust, doing the copy as late as possible is good, but 
make it return a "const MemoryRegionSection*" so that there's no risk of 
overwriting data.  Hopefully this does not show a bigger problem!

Paolo

> In addtion, add a global variable `unassigned_section` to help get a
> pointer to an invalid MemoryRegionSection.


