Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C13CD1D485
	for <qemu-rust@archiver.kernel.org>; Fri,  9 Jan 2026 12:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1veBJb-0005zc-7W; Fri, 09 Jan 2026 07:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veBJ8-0005hb-Kr
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 07:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veBJ4-0001B8-Sk
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 07:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767960568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z8Oy2HdKz+jorEMRBnm2EuOPjz+pXynn9DkCLEKOX9I=;
 b=COV6AmfiMiHmXIqhEECkLQBVCcp7vGt/S9MNqT7oeGlcrWwVe0CPhCEfYK5LaYJT92W+id
 VKwakwyxUuBLMuy73LOtUQwtB4Lg2yTFss7KPwu9mbWgdSXh+Y8vOCgKZTAeLzqu4UEQ5m
 O8kqSvAC+OTTz52flcpohykkY5kpzHY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-ajByzkROMqCs7SEywlvEmQ-1; Fri, 09 Jan 2026 07:09:26 -0500
X-MC-Unique: ajByzkROMqCs7SEywlvEmQ-1
X-Mimecast-MFC-AGG-ID: ajByzkROMqCs7SEywlvEmQ_1767960566
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430ffc4dc83so3468401f8f.3
 for <qemu-rust@nongnu.org>; Fri, 09 Jan 2026 04:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767960566; x=1768565366;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8Oy2HdKz+jorEMRBnm2EuOPjz+pXynn9DkCLEKOX9I=;
 b=g7Z/W26xGoov6QNl9qtgFld0YtrK6+ZZ9ciOMeBlfUrtA1Q33yMTdOwLBdwxauSwq5
 r9OxeIkr6VDKB+OL9hZHroMpYp4CS9ItfYLZwJbfLXAMS/BZBwR5Ev2aYGfO2siqy5Kj
 +3SxDY18mS2j64/KUv++8IkP4KA0nnJguvq5TF/USR1LEfRr6r0+Czh2dASaTKifFi44
 FIzNLpkzTcehtReisU9l3YBg4fAYTV6dVQQ8wQXW4lEA0SqyCE9RrLj9RRpP7q3elTNl
 5/g0DyYkgHOgJ05nxQo5c7ezcJ3x10b64ITGbTatIMjhFMr85bUfUl6MzjKuG+7py4BK
 rdzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYRUduP3UA69utDR2LL8tSZR2/FLDWxkzUXn5YVNM2snxuWKvWdXin5pktpU/SVGgFYKRs+m9Ggqg=@nongnu.org
X-Gm-Message-State: AOJu0Yw7fza7S4uAptNbz+6tNonH7BDG/CTmc5l92uRohyZpcuu3BPj1
 lTyv7r/H5fb2o3GItNs93kc0+XZVHiU5Vuk5k69OF7Re3Dm8R7OxL8sckGRP4xc4itUEV5X6Z9f
 M+e451qj49Y49h88Tt3a8/Kd0ieoThvxzwwz+eSodI+aDl0JyctPjK7Q=
X-Gm-Gg: AY/fxX56b6N5D4Oj8QyB7gTbx5cxzjxRsNiEBepvUZQejDf9emGjwKYZ1bwq5hMu3Q/
 ifXAvwCsFdWauauGwPGr3G77Ix87KMlCTAgldWexnFyZ/t4ye9SsiJhnIAyjOrZ110klPUgM38S
 XozjbBiSYjSsG/jZZdbs9sYHjmE1zosMf4T3AvBDm/gLAEiA0wWNjZrllbDe5n5becaUQIhCIf6
 Wc3ZH+9McZpVud/RgrUy/qzhNwkO1VeJ7wY2Glx5EzXQi/bVXp/2f/VOoBoDPdK5FWWOids4xeB
 /TdImOApfJkmjqLmxVC0ISpQbyLKf6focfybdk0S0jT31kpxnE8Np7P74moZVfwcV8HvNgMFxqT
 9iqGCas2XZWkPYog4R6Prk98qlMP6ZwrU1mQplh5Wbs4/J1Hus17k5Fo3SIDaduAhVtsrPxiihD
 SnRQRwiWl/uxq7EQ==
X-Received: by 2002:a05:600c:a317:b0:477:9976:9e1a with SMTP id
 5b1f17b1804b1-47d85bf063cmr82502005e9.6.1767960565692; 
 Fri, 09 Jan 2026 04:09:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzZDIiD3YTzKPpn5Kla0oSBx1QdyE0RX/8yKlMy8hjF+QysLqxEFtDaZ7aLL0IU1D2f2yn8g==
X-Received: by 2002:a05:600c:a317:b0:477:9976:9e1a with SMTP id
 5b1f17b1804b1-47d85bf063cmr82501675e9.6.1767960565300; 
 Fri, 09 Jan 2026 04:09:25 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f4ddsm213412155e9.2.2026.01.09.04.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 04:09:24 -0800 (PST)
Message-ID: <6e60a89f-6798-4ea5-bbd0-553130786cec@redhat.com>
Date: Fri, 9 Jan 2026 13:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/24] include: define constant for early constructor
 priority
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-3-berrange@redhat.com>
 <d3ca3fb5-e972-4446-b32c-f20fd8825cca@redhat.com>
 <aWDqie0eYZ8GeQHF@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aWDqie0eYZ8GeQHF@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OOvhizHPpm39Woz_-OTYSGa7JrwySOBbLd9FPPIBXrE_1767960566
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 1/9/26 12:46, Daniel P. Berrangé wrote:
> IMHO the root problem is that it is pretty dubious for us to be
> spawning the RCU thread from a constructor. Constructors should
> be limited to minimal initialization of state. Spawning threads
> is outside the boundary of what I'd consider reasonable for
> a constructor todo. I didn't want try to tackle refactoring the
> RCU thread creation though, hence this gross workaround.

I see.  Maybe we could (just as gross but smaller) do the RCU 
constructor late.  Not something that you need to do now, of course.

Paolo


