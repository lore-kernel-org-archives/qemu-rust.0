Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tpYCn-0006q2-4j
	for mharc-qemu-rust@gnu.org; Tue, 04 Mar 2025 14:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tpYCO-0006in-C8
 for qemu-rust@nongnu.org; Tue, 04 Mar 2025 14:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tpYCL-0003fr-Qb
 for qemu-rust@nongnu.org; Tue, 04 Mar 2025 14:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741117499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tmIv44zPtxIDvzjpq4iHerVOxcgBtfTsXACjwPGsLuI=;
 b=FsGczYWE66M2vlV/CV1IIqKy/DSP0NMpA9Ps8luAvzL/8xk/3Sl7/IcG3eXKWP4p98Gr3U
 qJwgU3hAQIM22IkRjV59b9YQ/JLu1G5enMTzS+GibbdEMxufhisOVZM41BWcwZ83NkOBZ1
 cWTNx3A6DwVJOBFgRs6CGC+6de2AJP0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-9bZZO1UwOrei8kHp_uXpAQ-1; Tue, 04 Mar 2025 14:44:56 -0500
X-MC-Unique: 9bZZO1UwOrei8kHp_uXpAQ-1
X-Mimecast-MFC-AGG-ID: 9bZZO1UwOrei8kHp_uXpAQ_1741117495
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-390df5962e1so56660f8f.0
 for <qemu-rust@nongnu.org>; Tue, 04 Mar 2025 11:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741117495; x=1741722295;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tmIv44zPtxIDvzjpq4iHerVOxcgBtfTsXACjwPGsLuI=;
 b=rSLG6WX9FF6sQ8Q8AAACta/YJQD72xpnvoPrQkX9/wp4CtqraCnZM6b/qIlz+/NHgR
 d+bRmXdMluCbcuQ3+3/j3913WekGY1Zvvf80jG9Y28ZyJ8fIErMSiakUJ3ToITrInT/v
 +kS/Tswuz/s+4JxVt+zYlYtbI5VUJx7HvY6leBSAb3C6lEQ7DtqMerREpW3C26r1xiOw
 t1cqQnus+hqqQvU4He3f2FIAGOzXzpp5TUNZtIoNLJcTvxLNWrMybpgL/VYLq7dTaw2E
 N7wKMhqs2a/zoV+D9ZiZPH5djUTxKq8cz4mMFoOhYndPQL5TowOw1VL0DOIehV6OwaSk
 kbOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3WXJ/QmYdulmZbcu6NMS1/7D2fp/3pKSmkZ1ykiyL+g+XhfGOl6/6C26FRtPNpARYITOTeWpIOgs=@nongnu.org
X-Gm-Message-State: AOJu0Yz0EDpgQowUNLSJlk10Lqu6UpYZ74SMwDf8gJgQP8IoTwBWSG1I
 BSWtivaVbLtwipxtY2o0yrOTLs1L/e/LlPyNm+OUhcJ7engJOFmddwKoNnWDjhbt5ND4SCNu0DO
 xerJwcao/OC/7IZ5EbrqYDW/TJZk/CJ1lMddvYJm9fb0LeRJ+qP0=
X-Gm-Gg: ASbGncujMD83QjLJg+jeArolFFkPIsyIttIBhE5Ie9dIbC9TEY45Wo3dqyiOFBIx5qA
 Iq0zb57gHY58suSQnIfEQCsejric2aDDa6QTVIktL30FlvFJj5NanyoQL2B4w8CCglsoqCaOkNR
 K+S+a2i/VjttEtsMteO7KbIpiILaS+k1zm3LH3BwVzBHhkVa8nvY5QFGW2vp6v7yvDrqG/k8wfF
 eC90AfvSq0y8S9PeSvh2gdRmWQAdYJmrMMyWBhUqcJIjWoJ1n69LEIhcICmu74NAHug26WIfZaP
 Ui/rnndpNaCXsG0Ezho=
X-Received: by 2002:a05:6000:154e:b0:390:fe2d:3172 with SMTP id
 ffacd0b85a97d-391155fa457mr3482369f8f.3.1741117495342; 
 Tue, 04 Mar 2025 11:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsBhwPJdfZObhvsd8Hhufx6ErDTMJRDFhCDgfxLLjoSulUTK7jZ/QnOeidw+RjwlaZVHxAaQ==
X-Received: by 2002:a05:6000:154e:b0:390:fe2d:3172 with SMTP id
 ffacd0b85a97d-391155fa457mr3482354f8f.3.1741117494931; 
 Tue, 04 Mar 2025 11:44:54 -0800 (PST)
Received: from [192.168.10.48] ([151.95.119.44])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-390e47a66bcsm18408519f8f.21.2025.03.04.11.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 11:44:54 -0800 (PST)
Message-ID: <79ca1c7b-6196-41f8-a25e-154b13fc70cb@redhat.com>
Date: Tue, 4 Mar 2025 20:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: cell: add full example of declaring a SysBusDevice
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250228085506.846381-1-pbonzini@redhat.com>
 <Z8cyhSfdeTufVzaj@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z8cyhSfdeTufVzaj@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnPeveE9Wyn3Y8AsLqpBn0kJTVvQwTW7Vip9vc0QfKU_1741117495
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 04 Mar 2025 19:45:07 -0000

On 3/4/25 18:04, Zhao Liu wrote:
>> +//! struct PL061Device {
> 
> Maybe PL061State?
> 
>> +//!     parent_obj: ParentField<SysBusDevice>,
>> +//!
>> +//!     // Configuration is read-only after initialization
>> +//!     pullups: u32,
>> +//!     pulldowns: u32,
>> +//!
>> +//!     // Same for sub-objects of the device
>> +//!     out: [Owned<IRQState>; N_GPIOS],
> 
> Should this be InterruptSource type?
> 
> Just have a quick look at pl061.c:
> 
> qdev_init_gpio_out(dev, s->out, N_GPIOS);
> 
> So in Rust side, `out` would be initialized by
> DeviceMethods::init_gpio_out().
> 
> 
> Others are fine for me ~ with above nits fixed,
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Yes, all good points.  Looks like we're set for 10.0 soft freeze. :)

Paolo


